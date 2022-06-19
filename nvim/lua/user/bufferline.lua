local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    separator_style = "thin",
    always_show_bufferline = false,
    show_close_icon = false,
    show_buffer_close_icons = false,
  }
}
