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
  hi CursorLine guibg=NONE ctermbg=NONE
  hi CursorColumn guibg=NONE ctermbg=NONE
  hi MatchParen guifg=#d0ffc0 guibg=NONE gui=bold ctermfg=157 ctermbg=NONE cterm=bold
  hi Pmenu 		guifg=#ffffff guibg=NONE ctermfg=255 ctermbg=NONE
  hi PmenuSel 	guifg=#000000 guibg=NONE ctermfg=0 ctermbg=NONE
endif

" General colors
hi Cursor 		guifg=NONE    guibg=NONE gui=NONE ctermbg=NONE
hi Normal 		guifg=#e2e2e5 guibg=NONE gui=NONE ctermfg=253 ctermbg=NONE
hi NonText 		guifg=#808080 guibg=NONE gui=NONE ctermfg=244 ctermbg=NONE
hi LineNr 		guifg=#808080 guibg=NONE gui=NONE ctermfg=244 ctermbg=NONE
hi StatusLine 	guifg=#d3d3d5 guibg=NONE gui=italic ctermfg=253 ctermbg=NONE cterm=italic
hi StatusLineNC guifg=#939395 guibg=NONE gui=NONE ctermfg=246 ctermbg=NONE
hi VertSplit 	guifg=#444444 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE
hi Folded 		guibg=NONE guifg=#a0a8b0 gui=NONE ctermbg=NONE ctermfg=248
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold ctermfg=254 cterm=bold
hi Visual		guifg=#faf4c6 guibg=NONE gui=NONE ctermfg=254 ctermbg=NONE
hi SpecialKey	guifg=#808080 guibg=NONE gui=NONE ctermfg=244 ctermbg=NONE

" Syntax highlighting
hi Comment 		guifg=#808080 gui=italic ctermfg=244
hi Todo 		guifg=#8f8f8f gui=italic ctermfg=245
hi Boolean      guifg=#b1d631 gui=NONE ctermfg=148
hi String 		guifg=#b1d631 gui=italic ctermfg=148
hi Identifier 	guifg=#b1d631 gui=NONE ctermfg=148
hi Function 	guifg=#ffffff gui=bold ctermfg=255
hi Type 		guifg=#7e8aa2 gui=NONE ctermfg=103
hi Statement 	guifg=#7e8aa2 gui=NONE ctermfg=103
hi Keyword		guifg=#ff9800 gui=NONE ctermfg=208
hi Constant 	guifg=#ff9800 gui=NONE  ctermfg=208
hi Number		guifg=#ff9800 gui=NONE ctermfg=208
hi Special		guifg=#ff9800 gui=NONE ctermfg=208
hi PreProc 		guifg=#faf4c6 gui=NONE ctermfg=230
hi Todo         guifg=#000000 guibg=NONE gui=italic

" Code-specific colors
hi pythonOperator guifg=#7e8aa2 gui=NONE ctermfg=103

hi Search     guifg=white	guibg=NONE	cterm=NONE	gui=underline

