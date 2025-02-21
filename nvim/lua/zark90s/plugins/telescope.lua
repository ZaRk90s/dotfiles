return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      }
    },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    
    -- Only load fzf extension if available
    local status_ok, _ = pcall(require, "telescope._extensions.fzf")
    if status_ok then
      telescope.load_extension("fzf")
    end
    
    -- Fix keymaps
    local keymap = vim.keymap
    keymap.set("n", "ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    keymap.set("n", "fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
    keymap.set("n", "fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    keymap.set("n", "fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
    keymap.set("n", "fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
    keymap.set("n", "fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search in buffer" })
  end,
  }
}

