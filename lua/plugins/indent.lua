return {
    "saghen/blink.indent",
    cmd = "BlinkIndent",
    keys = {
        { "<leader>fi", "<cmd>BlinkIndent<cr>", desc = "Indentation Visualization" },
        { "<leader>fi", "<cmd>blink.indent, enabled = false<cr>" }
    },
    colors = { "BlinkIndentOrange", "BlinkIndentViolet", "BlinkIndentBlue",
        "BlinkIndentYellow", "BlinkIndentGreen", "BlinkIndentCyan", "BlinkIndentRed" },
    opts = {
        blocked = {
            buftypes = { include_defaults = true },
            filetypes = { include_defaults = true },
        },
        static = {
            enabled = true,
            char = "▎",
            priority = 1,
            highlights = { "BlinkIndent" },
        },
        scope = {
            enabled = true,
            char = "▎",
            -- set this to a single highlight, such as "BlinkIndent" to disable rainbow-style indent guides
            -- highlights = { "BlinkIndentScope" },
            highlights = colors,
            underline = {
                enabled = true,
                -- optionally add: "BlinkIndentRedUnderline",
                -- "BlinkIndentCyanUnderline", "BlinkIndentYellowUnderline", "BlinkIndentGreenUnderline"
                highlights = colors,
            },
        },
    }
}
