return {
    {
        -- Install "deno" before you install this plugin, because later
        -- you will have troubles to use this plugin
        -- "Peek error: error: Module not found"
        -- "This error can happen when you install peek.nvim without 
        -- deno already installed. If you have deno installed, try 
        -- reinstalling peek.nvim."
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                filetype = { 'markdown', 'conf' },
                app = 'webview',
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
}
