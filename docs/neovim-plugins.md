# Neovim Plugins Reference

A comprehensive list of all plugins configured in this Neovim setup,
organized by category.

## 🔍 Navigation & Search

### folke/snacks.nvim

**Primary navigation plugin** - Fast picker with utilities and notifications

- **Features**: File picker, live grep, git integration, notifications, debug utilities, git browse, undo tree, scratch buffers
- **Key Bindings**:
  - `Space+t`: Smart file picker
  - `Space+j`: Live grep
  - `Space+b`: Branch files
  - `Space+g`: Git status
  - `Space+r`: Recent files
  - `Space+n`: Notifications
  - `Space+h`: Help tags
  - `Space+c`: Git commits for file
  - `Space+i`: Buffer lines search
  - `Space+f`: Grep word under cursor
  - `Space+d`: Files in current directory
  - `Space+u`: Resume last search
  - `,u`: Undo tree picker
  - `,.`: Toggle scratch buffer
  - `,>`: Select scratch buffer
  - `sL`: Git browse (open)
  - `sl`: Git browse (copy URL)
- **Configuration**: Vertical preview layout

## 📝 Code Completion & LSP

### saghen/blink.cmp

**Modern completion engine** - Replaces nvim-cmp

- **Sources**: LSP, path, snippets, buffer, dadbod (SQL)
- **Features**: Fast, async completion with minimal configuration

### neovim/nvim-lspconfig

**LSP configuration** with Mason integration

- **Servers**: elixirls, lua_ls, vtsls, vue_ls
- **Features**: Auto-installation, custom keybindings

### folke/lazydev.nvim

#### Lua development enhancements

- **Purpose**: Better Lua completion for Neovim config development

### rafamadriz/friendly-snippets

#### Snippet collection

- **Purpose**: Common code snippets for multiple languages

## 🎨 UI & Appearance

### catppuccin/nvim

**Colorscheme** - Latte (light) flavor

- **Theme**: Clean, pastel color palette

### folke/which-key.nvim

#### Key binding popup

- **Purpose**: Shows available keybindings when typing

### nvim-mini/mini.statusline

#### Custom statusline

- **Features**: Minimal, informative status bar

### nvim-mini/mini.icons

#### Icon support

- **Purpose**: File type icons throughout the interface

### nvim-mini/mini.files

#### File explorer

- **Key Bindings**: `Space+e`, `-`
- **Features**: Tree-style file navigation

## 🔧 Code Formatting & Linting

### stevearc/conform.nvim

#### Code formatting

- **Formatters**: prettier, stylua, black, mix (Elixir), sqlfluff
- **Key Binding**: `,,` (format current buffer)
- **Features**: Auto-format on save for specific file types

### mfussenegger/nvim-lint

#### Linting

- **Linters**: credo (Elixir), yamllint, markdownlint, sqlfluff
- **Features**: Debounced linting on file events

## 🎯 Text Objects & Navigation

### nvim-mini/mini.ai

#### Advanced text objects

- **Objects**: comments, functions, numbers, buffer, indent
- **Purpose**: Enhanced text selection and manipulation

### nvim-mini/mini.surround

#### Surround operations

- **Key Bindings**: `sa` (add), `sd` (delete), `sr` (replace)
- **Purpose**: Manipulate surrounding characters (quotes, brackets, etc.)

### rhysd/clever-f.vim

#### Enhanced f/F/t/T motions

- **Purpose**: Improved forward/backward character search
- **Integration**: Works with quick-scope for visual highlighting

### unblevable/quick-scope

#### Visual f/F/t/T targets

- **Purpose**: Highlights unique characters for f/F/t/T jumps
- **Integration**: Works with clever-f for enhanced navigation

### chentoast/marks.nvim

#### Mark management

- **Purpose**: Enhanced mark visualization and navigation

## 🗂️ File & Project Management

### rgroli/other.nvim

**Project navigation** - Elixir and Rails configuration

- **Key Binding**: `Space+a` (alternate file)
- **Features**: Switch between lib/test files, supports Rails and Elixir patterns

### nvim-mini/mini.splitjoin

#### Split/join lines

- **Key Binding**: `ss`
- **Purpose**: Toggle between single/multi-line constructs

## 🔄 Version Control

### lewis6991/gitsigns.nvim

#### Git integration

- **Key Bindings**:
  - `]c`, `[c`: Hunk navigation
  - `sg`, `su`: Stage/unstage hunks
  - `sb`, `sB`: Blame current/all lines
- **Features**: Git diff in sign column, blame info

## 🗄️ Database Management

### kristijanhusak/vim-dadbod-ui

#### Database UI

- **Purpose**: Visual database management interface

### tpope/vim-dadbod

#### Database operations

- **Purpose**: Execute SQL queries directly from Neovim

### kristijanhusak/vim-dadbod-completion

#### SQL completion

- **Purpose**: Autocomplete for database schemas and tables

## 🧪 Testing & Development

### janko-m/vim-test

**Test runner** - Elixir-focused

- **Key Bindings**:
  - `,t`: Run test under cursor
  - `,k`: Run nearest test
  - `,f`: Run current test file
  - `,s`: Run test suite
  - `,v`: Visit last test file
- **Integration**: Uses Vimux for tmux integration

### preservim/vimux

#### Tmux integration

- **Purpose**: Send commands to tmux panes from Neovim

### zbirenbaum/copilot.lua

#### AI code completion

- **Features**: Tab acceptance, word/line completion
- **Integration**: Works alongside blink.cmp

## 🔧 Syntax & Parsing

### nvim-treesitter/nvim-treesitter

#### Syntax highlighting

- **Languages**: CSS, Dockerfile, Elixir, HTML, JS/TS, Lua, SQL, Vue, YAML
- **Key Bindings**:
  - `CR`, `BS`, `Tab`: Incremental selection
  - `]f`, `[f`, `]F`, `[F`: Function navigation

### nvim-treesitter/nvim-treesitter-textobjects

#### Treesitter text objects

- **Purpose**: Advanced text objects based on syntax tree

### folke/ts-comments.nvim

#### Smart commenting

- **Purpose**: Context-aware comment toggling

## 🔧 Utility & QoL

### alexghergh/nvim-tmux-navigation

#### Tmux navigation

- **Key Bindings**: `Ctrl+j+hjkl`
- **Purpose**: Seamless navigation between Neovim and tmux panes

### romainl/vim-qf

#### Quickfix enhancements

- **Key Bindings**:
  - `]q`, `[q`, `,q`: Quickfix navigation
  - `]l`, `[l`, `,l`: Location list navigation
- **Purpose**: Improved quickfix and location list handling

## Plugin Architecture

- **Plugin Manager**: lazy.nvim with lazy loading
- **Configuration**: Modular setup in `lua/custom/lazy/`
- **Disabled Plugins**: 2html_plugin, gzip, netrwPlugin, etc.
- **Load Strategy**: Lazy loading for performance optimization

## Key Configuration Files

- `init.lua`: Main configuration entry point
- `lua/custom/lazy/`: Individual plugin configurations
- `after/lsp/`: Language server configurations
- `after/ftplugin/`: File type specific settings
- `lua/util/`: Utility functions

## Language-Specific Setup

### Elixir

- **LSP**: elixirls with full language support
- **Testing**: vim-test with ExUnit integration
- **Formatting**: mix format via conform.nvim
- **Linting**: credo via nvim-lint
- **Project**: other.nvim for lib/test navigation

### Lua

- **LSP**: lua_ls with Neovim-specific configuration
- **Formatting**: stylua via conform.nvim
- **Development**: lazydev.nvim for enhanced completion

### TypeScript/Vue

- **LSP**: vtsls, vue_ls
- **Formatting**: prettier via conform.nvim

### SQL

- **Completion**: dadbod-completion with schema awareness
- **Formatting**: sqlfluff via conform.nvim
- **UI**: dadbod-ui for database management
