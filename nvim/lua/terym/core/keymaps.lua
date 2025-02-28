vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>p", "<cmd>lua require('nabla').enable_virt({autogen = true, silent = true})<CR>", { desc = "use nabla" })
keymap.set("n", "<leader>[", "<cmd>lua require('nabla').disable_virt()<CR>", { desc = "use nabla" })

-- Molten keybindings
keymap.set("n", "<leader>mi", ":MoltenInit<CR>",
    { desc = "Initialize the plugin" })
keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>",
    { desc = "run operator selection" })
keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>",
    { desc = "evaluate line" })
keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>",
    { desc = "re-evaluate cell" })
keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
    { desc = "evaluate visual selection" })
keymap.set("n", "<leader>rd", ":MoltenDelete<CR>",
    { desc = "molten delete cell" })
keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>",
    { desc = "hide output" })
keymap.set("n", "<leader>os", ":noautocmd MoltenEnterOutput<CR>",
    { desc = "show/enter output" })
