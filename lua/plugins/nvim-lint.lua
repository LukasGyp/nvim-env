return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    local wanted_linters = {
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      zsh = { "shellcheck" },
    }

    local function available_linters(candidates)
      local selected = {}
      for _, name in ipairs(candidates) do
        local linter = lint.linters[name]
        local cmd = linter and linter.cmd
        if type(cmd) == "string" and vim.fn.executable(cmd) == 1 then
          table.insert(selected, name)
        end
      end
      return selected
    end

    for ft, linters in pairs(wanted_linters) do
      lint.linters_by_ft[ft] = available_linters(linters)
    end

    local group = vim.api.nvim_create_augroup("UserNvimLint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      group = group,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>cl", function()
      lint.try_lint()
    end, { desc = "Lint: current buffer" })
  end,
}
