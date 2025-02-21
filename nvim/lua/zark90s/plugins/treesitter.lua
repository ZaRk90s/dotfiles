return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- Add languages to be installed here
            ensure_installed = { 
                "c", 
                "cpp", 
                "cmake", 
                "lua", 
                "vim", 
                "vimdoc", 
                "zig",
                "markdown", 
                "markdown_inline",
                "bash", 
                "javascript",
                "python",
                "go",
            },
            
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            
            -- Automatically install missing parsers when entering buffer
            auto_install = true,
            
            highlight = {
                enable = true,
                -- Temporarily disable C to check if it stops the error
                disable = { "c" },
                additional_vim_regex_highlighting = { "markdown" },
            },
            
            indent = { enable = true },
            
            -- Treesitter Text Objects
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>a"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>A"] = "@parameter.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            },
        })

        -- Custom parser for Templ
        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "master",
            },
        }
        vim.treesitter.language.register("templ", "templ")
    end
}
