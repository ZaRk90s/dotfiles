return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          
          -- Navigation
          vim.keymap.set("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true, buffer = bufnr })
          
          vim.keymap.set("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true, buffer = bufnr })
          
          -- Actions
          vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
          vim.keymap.set("v", "<leader>hs", function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, { buffer = bufnr })
          vim.keymap.set("v", "<leader>hr", function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hb", function() gs.blame_line { full = true } end, { buffer = bufnr })
          vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hd", gs.diffthis, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hD", function() gs.diffthis("~") end, { buffer = bufnr })
          vim.keymap.set("n", "<leader>td", gs.toggle_deleted, { buffer = bufnr })
        end,
      })
    end,
  },
}
