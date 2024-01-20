return {
  "APZelos/blamer.nvim",
  -- Only load if on a compatible OS and git is installed
  cond = function()
    local goodOS = (vim.fn.has("linux") == 1) or (vim.fn.has("mac") == 1)
    local hasGit = vim.fn.executable("git") == 1
    return goodOS and hasGit
  end,
  config = function()
    vim.g.blamer_enabled = 1
    vim.g.blamer_delay = 500
    vim.g.blamer_template = "<committer>, <committer-time> • <summary>"
    vim.g.blamer_prefix = ">"
  end,
  cmd = { "BlamerToggle", "BlamerShow" },
}
