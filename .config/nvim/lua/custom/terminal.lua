-- taken from nvchad's ui

local M = {}

vim.g.nvchad_terms = {}

local pos_data = {
	sp = { resize = "height", area = "lines" },
	vsp = { resize = "width", area = "columns" },
	["bo sp"] = { resize = "height", area = "lines" },
	["bo vsp"] = { resize = "width", area = "columns" },
}

local config = {
	winopts = {
		number = false,
		relativenumber = false,
        scrolloff = 0,
	},
	sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
	float = {
		relative = "editor",
		row = 0.3,
		col = 0.25,
		width = 0.5,
		height = 0.4,
		border = "single",
	},
}

vim.g.nvhterm = false
vim.g.nvvterm = false

local function save_term_info(index, val)
	local terms_list = vim.g.nvchad_terms
	terms_list[tostring(index)] = val
	vim.g.nvchad_terms = terms_list
end

local function id_to_opts(id)
	for _, opts in pairs(vim.g.nvchad_terms) do
		if opts.id == id then
			return opts
		end
	end
end

local function create_float(buffer, float_opts)
	local opts = vim.tbl_deep_extend("force", config.float, float_opts or {})

	opts.width = math.ceil(opts.width * vim.o.columns)
	opts.height = math.ceil(opts.height * vim.o.lines)
	opts.row = math.ceil(opts.row * vim.o.lines)
	opts.col = math.ceil(opts.col * vim.o.columns)

	vim.api.nvim_open_win(buffer, true, opts)
end

local function format_cmd(cmd)
	return type(cmd) == "string" and cmd or cmd()
end

M.display = function(opts)
	if opts.pos == "float" then
		create_float(opts.buf, opts.float_opts)
	else
		vim.cmd(opts.pos)
	end

	local win = vim.api.nvim_get_current_win()
	opts.win = win

	vim.bo[opts.buf].buflisted = false
	vim.cmd("startinsert")

	if
		(opts.pos == "sp" and not vim.g.nvhterm)
		or (opts.pos == "vsp" and not vim.g.nvvterm)
		or (opts.pos ~= "float")
	then
		local pos_type = pos_data[opts.pos]
		local size = opts.size and opts.size or config.sizes[opts.pos]
		local new_size = vim.o[pos_type.area] * size
		vim.api["nvim_win_set_" .. pos_type.resize](0, math.floor(new_size))
	end

	vim.api.nvim_win_set_buf(win, opts.buf)

	local winopts = vim.tbl_deep_extend("force", config.winopts, opts.winopts or {})

	for k, v in pairs(winopts) do
		vim.wo[win][k] = v
	end
end

local function create(opts)
	local buf_exists = opts.buf
	opts.buf = opts.buf or vim.api.nvim_create_buf(false, true)

	local shell = vim.o.shell
	local cmd = { shell }

	if opts.cmd and opts.buf then
		cmd = { shell, "-c", format_cmd(opts.cmd) .. "; " .. shell }
	end

	M.display(opts)

	save_term_info(opts.buf, opts)

	if not buf_exists then
		vim.fn.termopen(cmd)
	end

	vim.g.nvhterm = opts.pos == "sp"
	vim.g.nvvterm = opts.pos == "vsp"
end

M.new = function(opts)
	create(opts)
end

M.toggle = function(opts)
	local x = id_to_opts(opts.id)
	opts.buf = x and x.buf or nil

	if (x == nil or not vim.api.nvim_buf_is_valid(x.buf)) or vim.fn.bufwinid(x.buf) == -1 then
		create(opts)
	else
		vim.api.nvim_win_close(x.win, true)
	end
end

M.runner = function(opts)
	local x = id_to_opts(opts.id)
	local clear_cmd = opts.clear_cmd or "clear; "
	opts.buf = x and x.buf or nil

	if x == nil then
		create(opts)
	else
		if vim.fn.bufwinid(x.buf) == -1 then
			M.display(opts)
		end

		local cmd = format_cmd(opts.cmd)

		if x.buf == vim.api.nvim_get_current_buf() then
			vim.api.nvim_set_current_buf(vim.g.buf_history[#vim.g.buf_history - 1])
			cmd = format_cmd(opts.cmd)
			vim.api.nvim_set_current_buf(x.buf)
		end

		local job_id = vim.b[x.buf].terminal_job_id
		vim.api.nvim_chan_send(job_id, clear_cmd .. cmd .. " \n")
	end
end

vim.api.nvim_create_autocmd("TermClose", {
	callback = function(args)
		save_term_info(args.buf, nil)
	end,
})

return M
