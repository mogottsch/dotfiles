require("dapui").setup()

local dap = require('dap')

dap.adapters.python = {
    type = 'executable',
    command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python',
    args = {'-m', 'debugpy.adapter'}
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function() return '/usr/bin/python' end
    }
}

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = {'/usr/local/vscode-php-debug/out/phpDebug.js'}
}

dap.configurations.php = {
    {
        name = "DOCKER XDEBUG",
        type = "php",
        request = "launch",
        port = 9000,
        pathMappings = {["/var/www/html"] = "${workspaceFolder}/laravel"},
        hostname = "172.17.0.1",
        xdebugSettings = {
            max_data = 65535,
            show_hidden = 1,
            max_children = 100,
            max_depth = 5
        }
    }
}

