" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <Esc> pumvisible() ? deoplete#cancel_popup() : "\<Esc>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-g> deoplete#undo_completion()

" <C-l>: redraw candidates
inoremap <expr><C-g>       deoplete#refresh()
" inoremap <silent><expr><C-l>       deoplete#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "<CR>"
function! s:my_cr_function() abort
  return deoplete#cancel_popup() . "\<CR>"
  " return deoplete#close_popup()
endfunction

inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"

inoremap <expr> '  pumvisible() ? deoplete#close_popup() : "'"

call deoplete#custom#source('ghc', 'sorters', ['sorter_word'])

" Use auto delimiter
" call deoplete#custom#source('_', 'converters',
"       \ ['converter_auto_paren',
"       \  'converter_auto_delimiter', 'remove_overlap'])
call deoplete#custom#source('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
      \ ])

call deoplete#custom#source('clang', 'input_pattern', '\.\w*|\.->\w*|\w+::\w*')
call deoplete#custom#source('clang', 'max_pattern_length', -1)



" Prams of deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
let g:deoplete#keyword_patterns.tex = '[^\w|\s][a-zA-Z_]\w*'
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.python = ''
let g:deoplete#omni#functions = {}
let g:deoplete#enable_camel_case = 1
let g:deoplete#skip_chars = ['(', ')']
" let g:deoplete#enable_refresh_always = 0
" let g:deoplete#auto_complete_delay = 50
" let g:deoplete#auto_complete_start_length = 3

" Hidden autocomplete preview
set completeopt-=preview
