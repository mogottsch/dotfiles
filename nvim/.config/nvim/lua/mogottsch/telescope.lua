local actions = require('telescope.actions')
local previewers = require("telescope.previewers")

require('telescope').setup {
    defaults = {
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        mappings = {i = {['<C-q>'] = actions.send_to_qflist}}
    }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('git_worktree')

local module = {}

module.search_dotfiles = function()
    require('telescope.builtin').find_files({
        prompt_title = '< VimRC >',
        cwd = '/home/moritz/dotfiles',
        hidden = true
    })
end

module.live_grep_with_hidden = function()
    require('telescope.builtin').live_grep({
        vimgrep_arguments = {
            "rg", "--color=never", "--no-heading", "--with-filename",
            "--line-number", "--column", "--smart-case", "--hidden"
        }
    })
end
return module
