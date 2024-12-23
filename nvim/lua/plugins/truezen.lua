local status_ok, tz = pcall(require, "true-zen")
if not status_ok then
  require("notify")("Couldn't load TrueZen")
  return
end

tz.setup({
    integrations = {
      tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
      kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
        enabled = false,
        font = "+3"
      },
      twilight = false, -- enable twilight (ataraxis)
      lualine = true -- hide nvim-lualine (ataraxis)
    },
})
