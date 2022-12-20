-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- this isnt needed: require("nvim-lsp-installer").setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/Users/brunodasilva/projects/dev/java/workspaces/' .. project_name

local config = {
  cmd = {
    'java', -- or '/path/to/java11_or_newer/bin/java'
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:/Users/brunodasilva/.local/share/nvim/lsp_servers/lombok.jar',
    '-Xms1g',
    '-Xms2G',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', '/Users/brunodasilva/.config/nvim/ftplugin/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/Users/brunodasilva/.config/nvim/ftplugin/jdtls/config_mac',
    '-data', workspace_dir 
  },

  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  -- capabilities = capabilities

}

require('jdtls.setup').start_or_attach(config)

local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', 'gd', 'lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

vim.api.nvim_set_keymap('n', 'lA', '<cmd>lua require(\'jdtls\').code_action()<CR>', opts)

