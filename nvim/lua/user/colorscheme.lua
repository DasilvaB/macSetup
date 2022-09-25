vim.cmd [[
  try
    if strftime("%H") >= 8 && strftime("%H") <= 19
      set background=light
      colorscheme catppuccin
    else
      colorscheme catppuccin
    endif
  catch /^Vim\%((\a\+)\)\=E185/
    colorscheme default
    set background=dark
  endtry
]]

