local status_ok, numb = pcall(require, "numb")
if not status_ok then
  return
end

numb.setup {
  show_numbers = true,
  show_cursorline = true,
}
