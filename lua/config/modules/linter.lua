local g = vim.g
g.ale_ruby_rubucop_auto_correct_all = 1
g.ale_completion_enabled = 1
g.ale_completion_autoimport = 0
g.ale_linters = {
	javascript = {'eslint'},
  ruby = {'rubocop', 'ruby'},
  lua = {'lua_language_server'}
}

