-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local call = vim.call
local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
local Plug = vim.fn['plug#']

-----------------------------------------------------------
-- Functions
-----------------------------------------------------------
local on_attach = function(client, bufnr)
    ion(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    map(bufnr, 'n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    map(bufnr, 'n', 'gf', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map(bufnr, 'n', 'g=',  '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    map(bufnr, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    map(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

-----------------------------------------------------------
-- External packages
-----------------------------------------------------------
call('plug#begin', '~/.config/nvim/plugged')

Plug('AndrewRadev/sideways.vim')
Plug('AndrewRadev/splitjoin.vim')
Plug('airblade/vim-gitgutter')
Plug('christoomey/vim-tmux-navigator')
Plug('ctrlpvim/ctrlp.vim')
Plug('docunext/closetag.vim')
Plug('hrsh7th/nvim-compe')
Plug('janko-m/vim-test')
Plug('lokikl/vim-ctrlp-ag')
Plug('kabouzeid/nvim-lspinstall')
Plug('neovim/nvim-lspconfig')
Plug('rking/ag.vim')
Plug('ryanoasis/vim-devicons')
Plug('scrooloose/nerdtree')
Plug('sheerun/vim-polyglot')
Plug('sonph/onehalf', { rtp = 'vim' })
Plug('tpope/vim-commentary')
Plug('tpope/vim-dispatch')
Plug('tpope/vim-rails')
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
Plug('tpope/vim-unimpaired')
Plug('troydm/zoomwintab.vim')
Plug('vim-scripts/BufOnly.vim')

call('plug#end')

-----------------------------------------------------------
-- Packages settings
-----------------------------------------------------------
g.NERDTreeShowHidden = 1

require'lspinstall'.setup()
for _, server in pairs(require'lspinstall'.installed_servers()) do
    require'lspconfig'[server].setup{ on_attach = on_attach }
end
