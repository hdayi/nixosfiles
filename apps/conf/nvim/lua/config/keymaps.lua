-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- require("telescope").extensions.flutter.commands()

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Resize window using <ctrl> arrow keys
map("n", "<M-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<M-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<M-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<M-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- flutter tools
map("n", "<leader>FF", ":lua require('telescope').extensions.flutter.commands()<cr>", { desc = "Flutter Menu" })
map("n", "<leader>Fr", "<cmd>FlutterRun<cr>", { desc = "Flutter Run" })
map("n", "<leader>Fd", "<cmd>FlutterDevices<cr>", { desc = "FlutterDevices" })
map("n", "<leader>Fe", "<cmd>FlutterEmulators<cr>", { desc = "FlutterEmulators" })
map("n", "<leader>FL", "<cmd>FlutterReload<cr>", { desc = "FlutterReload" })
map("n", "<leader>FS", "<cmd>FlutterRestart<cr>", { desc = "FlutterRestart" })
map("n", "<leader>Fq", "<cmd>FlutterQuit<cr>", { desc = "FlutterQuit" })
map("n", "<leader>FQ", "<cmd>FlutterDetach<cr>", { desc = "FlutterDetach" })
map("n", "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", { desc = "FlutterOutlineToggle" })
--map("n", "<leader>Fb", "<cmd>FlutterOutlineOpen<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>Ft", "<cmd>FlutterDevTools<cr>", { desc = "FlutterDevTools" })
map("n", "<leader>FT", "<cmd>FlutterDevToolsActivate<cr>", { desc = "FlutterDevToolsActivate" })
map("n", "<leader>Fp", "<cmd>FlutterCopyProfilerUrl<cr>", { desc = "Copy Profile Url" })
map("n", "<leader>Fb", "<cmd>FlutterLspRestart<cr>", { desc = "LSP Restart" })
--map("n", "<leader>Fb", "<cmd>FlutterSuper<cr>", { desc = "Switch to Other Buffer" })
--map("n", "<leader>Fb", "<cmd>FlutterReanalyze<cr>", { desc = "Switch to Other Buffer" })
--

map("i", "jj", "<esc>", { desc = "Escape" })
map("n", "s", "s", { desc = "Substitude" })
map("n", "S", "S", { desc = "Substidude Line" })

-- horizontal teminal
map("n", "<leader>ft", ":10 split term://zsh<cr>GA", { desc = "Terminal Horizontal" })
map("n", "<leader>r", ":Ranger<cr>", { desc = "Ranger" })

local wk = require("which-key")
wk.register({ F = { name = "Flutter", b = "Flutter LSP Restart" } }, { prefix = "<leader>" })
