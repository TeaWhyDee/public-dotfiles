local tabnine = require('cmp_tabnine.config')

tabnine.setup({
	max_lines = 100,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = '..',
	ignored_file_types = {
		lua = true;
		markdown = true;
		vimwiki = true;
	},
	show_prediction_strength = true
})
