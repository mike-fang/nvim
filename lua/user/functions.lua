local M = {}

-- Create or update a session file in ~/.nvim/sessions/<current_working_dir>
function M.make_session()
  -- Build session directory path by concatenating HOME, `.nvim/sessions` and the current working directory
  local session_dir = os.getenv("HOME") .. "/.nvim/sessions" .. vim.fn.getcwd()

  -- If the directory is not writable, create it (mkdir -p)
  if vim.fn.filewritable(session_dir) ~= 2 then
    vim.fn.mkdir(session_dir, "p")
  end

  -- Construct the session file path
  local session_file = session_dir .. "/session.nvim"

  -- Save session
  vim.cmd("mksession! " .. session_file)
end

-- Load a session from ~/.nvim/sessions/<current_working_dir>
function M.load_session()
  local session_dir = os.getenv("HOME") .. "/.nvim/sessions" .. vim.fn.getcwd()
  local session_file = session_dir .. "/session.nvim"

  if vim.fn.filereadable(session_file) == 1 then
    vim.cmd("source " .. session_file)
  else
    vim.cmd([[echo "No session loaded."]])
  end
end

-- Only load session automatically if no file arguments are passed.
if vim.fn.argc() == 0 then
  vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    nested = true,
    callback = function()
      M.load_session()
    end,
  })
end

-- Automatically save session on VimLeave
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    M.make_session()
  end,
})

return M

