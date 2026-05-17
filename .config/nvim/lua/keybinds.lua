-- General
vim.keymap.set({ "n", "v" }, "<space>p", '"0p', { desc = "Paste from 0 register" })

-- Functions
local function find_files_from_project_git_root()
	local function is_git_repo()
		vim.fn.system("git rev-parse --is-inside-work-tree")
		return vim.v.shell_error == 0
	end
	local function get_git_root()
		local dot_git_path = vim.fn.finddir(".git", ".;")
		return vim.fn.fnamemodify(dot_git_path, ":h")
	end
	local opts = {}
	if is_git_repo() then
		opts = {
			cwd = get_git_root(),
		}
	end
	require("telescope.builtin").find_files(opts)
end

-- Telescope
vim.keymap.set("n", "<leader>f", find_files_from_project_git_root, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>g", require("telescope.builtin").live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>h", require("telescope.builtin").help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>o", require("telescope.builtin").oldfiles, { desc = "Telescope old files" })
vim.keymap.set("n", "<leader>s", require("telescope.builtin").spell_suggest, { desc = "Telescope spell suggest" })
vim.keymap.set("n", "<leader>c", function()
	require("telescope.builtin").find_files({
		cwd = "~/.config",
	})
end, { desc = "Telescope config files" })
vim.keymap.set("n", "<leader>a", function()
	require("telescope.builtin").find_files({
		cwd = "~/",
	})
end, { desc = "Telescope home directory" })
