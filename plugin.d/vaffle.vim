function! RenderMyFavoriteIcon(item) abort
  return WebDevIconsGetFileTypeSymbol(a:item.basename, a:item.is_dir)
endfunction
let g:vaffle_render_custom_icon = 'RenderMyFavoriteIcon'
