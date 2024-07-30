-- File: lua/custom/plugins/filetree.lua

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      source_selector = {
        winbar = true,
        statusline = true,
      },
      window = {
        mappings = {
          ['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
          ['<space>'] = {
            'toggle_node',
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false, -- only works on Windows for hidden files/directories
          hide_by_name = {
            --"node_modules"
          },
        },
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        group_empty_dirs = false, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = 'open_default', -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",  -- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
        window = {
          mappings = {
            ['<bs>'] = 'navigate_up',
            ['.'] = 'set_root',
            ['H'] = 'toggle_hidden',
            ['/'] = 'fuzzy_finder',
            ['D'] = 'fuzzy_finder_directory',
            ['#'] = 'fuzzy_sorter', -- fuzzy sorting using the fzy algorithm
            -- ["D"] = "fuzzy_sorter_directory",
            ['f'] = 'filter_on_submit',
            ['<c-x>'] = 'clear_filter',
            ['[g'] = 'prev_git_modified',
            [']g'] = 'next_git_modified',
            ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['og'] = { 'order_by_git_status', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },
          fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
            ['<down>'] = 'move_cursor_down',
            ['<C-n>'] = 'move_cursor_down',
            ['<up>'] = 'move_cursor_up',
            ['<C-p>'] = 'move_cursor_up',
          },
        },

        commands = {}, -- Add a custom command or override a global one using the same function name
      },
    }
  end,
}
