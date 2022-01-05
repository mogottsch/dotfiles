local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {mappings = {i = {['<C-q>'] = actions.send_to_qflist}}}
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

return module
