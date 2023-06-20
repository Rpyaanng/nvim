if vim.fn.has("nvim-0.9") == 0 then
  return
end

if vim.g.loaded_block_nvim ~= nil then
  return
end


vim.g.loaded_block_nvim = 1
