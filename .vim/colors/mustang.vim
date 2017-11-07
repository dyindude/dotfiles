" Maintainer:	Henrique C. Alves (hcarvalhoalves@gmail.com)
" Version:      1.0
" Last Change:	September 25 2008

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mustang"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=none ctermbg=none
  hi CursorColumn guibg=none ctermbg=none
  hi MatchParen guifg=#d0ffc0 guibg=none gui=bold ctermfg=157 ctermbg=none cterm=bold
  hi Pmenu 		guifg=#ffffff guibg=none ctermfg=255 ctermbg=none
  hi PmenuSel 	guifg=#000000 guibg=none ctermfg=0 ctermbg=none
endif

" General colors
hi Cursor 		guifg=NONE    guibg=none gui=none ctermbg=none
hi Normal 		guifg=#e2e2e5 guibg=none gui=none ctermfg=253 ctermbg=none
hi NonText 		guifg=#808080 guibg=none gui=none ctermfg=244 ctermbg=none
hi LineNr 		guifg=#808080 guibg=none gui=none ctermfg=244 ctermbg=none
hi StatusLine 	guifg=#d3d3d5 guibg=none gui=italic ctermfg=253 ctermbg=none cterm=italic
hi StatusLineNC guifg=#939395 guibg=none gui=none ctermfg=246 ctermbg=none
hi VertSplit 	guifg=#444444 guibg=none gui=none ctermfg=238 ctermbg=none
hi Folded 		guibg=none guifg=#a0a8b0 gui=none ctermbg=none ctermfg=248
hi Title		guifg=#f6f3e8 guibg=none	gui=bold ctermfg=254 cterm=bold
hi Visual		guifg=#faf4c6 guibg=none gui=none ctermfg=254 ctermbg=none
hi SpecialKey	guifg=#808080 guibg=none gui=none ctermfg=244 ctermbg=none

" Syntax highlighting
hi Comment 		guifg=#808080 gui=italic ctermfg=244
hi Todo 		guifg=#8f8f8f gui=italic ctermfg=245
hi Boolean      guifg=#b1d631 gui=none ctermfg=148
hi String 		guifg=#b1d631 gui=italic ctermfg=148
hi Identifier 	guifg=#b1d631 gui=none ctermfg=148
hi Function 	guifg=#ffffff gui=bold ctermfg=255
hi Type 		guifg=#7e8aa2 gui=none ctermfg=103
hi Statement 	guifg=#7e8aa2 gui=none ctermfg=103
hi Keyword		guifg=#ff9800 gui=none ctermfg=208
hi Constant 	guifg=#ff9800 gui=none  ctermfg=208
hi Number		guifg=#ff9800 gui=none ctermfg=208
hi Special		guifg=#ff9800 gui=none ctermfg=208
hi PreProc 		guifg=#faf4c6 gui=none ctermfg=230
hi Todo         guifg=#000000 guibg=none gui=italic

" Code-specific colors
hi pythonOperator guifg=#7e8aa2 gui=none ctermfg=103

hi Search     guifg=white	guibg=none	cterm=NONE	gui=underline

