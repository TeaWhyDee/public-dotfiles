#!/bin/sh

if [ "$1" = "-d" ]; then
 $0 $2 $3 &
 exit 0
fi ;

BACKUP_ALBUM="A Love Supreme [24-88 2010 AP Remaster Stereo PCM SACD]"

MPDCONF="/etc/mpd.conf";
FADERUNFILE="/tmp/fade.pid";
GPIOLED="/sys/devices/virtual/misc/sun4i-gpio/pin/ph10";

MPC="mpc";
BC="bc -l";
MPDPIDFILE=`sed -n 's/^[[:space:]]*pid_file[[:space:]]*"\?\([^"]*\)\"\?/\1/p' $MPDCONF`;
ORIG_VOLUME=`$MPC volume | sed -e 's/[^0-9]*\([0-9]*\).*/\1/'`;

gpio_led ()
{
   if [ -e "$GPIOLED" ]; then
     echo $1 > $GPIOLED ;
   fi
}

if [ -f "$FADERUNFILE" ]; then
 PID=`cat $FADERUNFILE`;
 if [ -d "/proc/$PID" ]; then
  kill `cat $FADERUNFILE`;
  rm -f $FADERUNFILE ;
  gpio_led 0 ;
  exit 0 ;
 fi
fi

if [ $# -ne 2 ] ; then
   echo "Usage: mpc-fade [OPTION] <diff-vol> <duration>" ;
   echo " OPTION:"
   echo "   -d       : daemonize - for crontab"
   echo ""
   echo " ARG:"
   echo "   diff-vol : volume from start to end";
   echo "              * negative: fade-out (and stop)";
   echo "              * positive: fade-in (and continue to play)";
   echo "   duration : fade-in/out duration";
   exit 1 ;
fi


# check if mpd is running, and with some files to play
if [ ! -e $MPDRUNFILE ]; then
   echo "Sorry, mpd is not running" ;
   exit 0 ;
fi;

echo $$ > $FADERUNFILE ;

if [ `$MPC playlist | wc -l` -eq 0 ]; then
   $MPC clear > /dev/null
   $MPC findadd album "$BACKUP_ALBUM" > /dev/null
fi

V1=$ORIG_VOLUME
V2=$(($V1 + $1));
STEP=-1;
SLEEP=$(($2 / ($V1-$V2)));
if [ $1 -gt 0 ] ; then
 V2=$ORIG_VOLUME;
 V1=$(($V2 - $1));
 STEP=1;
 SLEEP=$(($2 / ($V2-$V1)));
fi
if [ $V1 -lt 0 ]; then V1=0; fi;
if [ $V2 -lt 0 ]; then V2=0; fi;
if [ $V1 -gt 100 ]; then V1=100; fi;
if [ $V2 -gt 100 ]; then V2=100; fi;
if [ $SLEEP -lt 1 ]; then SLEEP=1; fi;
$MPC repeat on > /dev/null ;

V=$V1;
# echo "$V1 -> $V2 ($STEP every $SLEEP sec)";
$MPC volume $V > /dev/null ;
$MPC play > /dev/null ;
while [ $V != $V2 ] ; do
   gpio_led 1 ;
   $MPC volume $V > /dev/null ;
   V=$(($V + $STEP)) ;
   sleep $SLEEP;
done ;

if [ $STEP -lt 0 ]; then
 $MPC stop > /dev/null;
fi

$MPC repeat off > /dev/null ;
gpio_led 0 ;

$MPC volume $ORIG_VOLUME > /dev/null ;

rm -f $FADERUNFILE ;

exit 0
