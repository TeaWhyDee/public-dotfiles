lua << EOF
  require('psql').setup({
    database_name = 'lab10',
    execute_line        = '<leader>-e',
    execute_selection   = '<leader>-e',
    execute_paragraph   = '<leader>-p',
    close_latest_result = '<leader>-w',
    close_all_results   = '<leader>-W',
  })
EOF
