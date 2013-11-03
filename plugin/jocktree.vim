" jocktree.vim - Make NetRw more like NerdTree
" Maintainer:   Wikitopian <http://www.github.com/wikitopian/>
" Version:      1.0

" Borrowed from:
" http://modal.us/blog/2013/07/27/back-to-vim-with-nerdtree-nope-netrw/

if exists('g:loaded_jocktree') || &cp
  finish
endif
let g:loaded_jocktree = 1

" Toggle Vexplore with \w e
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
nnoremap <silent> <C-w>e :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" Change directory to the current buffer when opening files.
set autochdir

" vim:set et sw=2:
