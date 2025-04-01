local M = {}

function M.init()
  -- 只在 Neovide 中生效
  if not vim.g.neovide then
    return
  end

  M.config()
  if vim.g.transparent_background then
    M.background()
  end
  M.refresh(120, 5)
end

function M.config()
  -- 字体
  vim.o.guifont = "0xProto Nerd Font Mono:h12:b"
  -- 记住以前窗口的大小
  vim.g.neovide_remember_window_size = true
  -- 开启轨道动画
  vim.g.neovide_cursor_vfx_mode = "railgun"

  -- 开启alt和meta按键
  vim.g.neovide_input_macos_alt_is_meta = true
  -- 没有空闲
  vim.g.neovide_no_idle = true

  -- 退出需要确认
  vim.g.neovide_confirm_quit = true
  -- 是否全屏
  vim.g.neovide_fullscreen = true
  -- 启用无边框模式
  --vim.g.neovide_floating_window = true
  -- 设置窗口透明度
  --vim.g.neovide_floating_window_opacity = 0.9
end

function M.background()
  -- 直接计算透明度，避免依赖外部变量
  local transparency = 0.9
  local alpha = string.format("%x", math.floor(255 * transparency))
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_background_color = "#0f1117" .. alpha
end

function M.refresh(run_fps, free_fps)
  vim.g.neovide_refresh_rate = run_fps or 120 -- 添加默认值
  vim.g.neovide_refresh_rate_idle = free_fps or 5 -- 添加默认值
end

return M
