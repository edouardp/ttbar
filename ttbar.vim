
"amenu 950 ToolBar.-SEP950- :<CR>
aunmenu ToolBar
set toolbariconsize=medium

" Toggle Toolbar Command Playing
function! g:Toggle_Toolbar_80th()
    if !exists('g:toolbar_80th_state')
        let g:toolbar_80th_state = 2
    endif
    aunmenu ToolBar.80th
    if g:toolbar_80th_state == 1
        let g:toolbar_80th_state = 2
        anoremenu icon=80th-enabled 960 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
        set colorcolumn=80
        echo "On"
    else
        let g:toolbar_80th_state = 1
        anoremenu icon=80th-disabled 960 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
        set colorcolumn=0
        echo "Off"
    endif
	tmenu ToolBar.80th 80th Column Indicator
endfunction

let g:toolbar_80th_state = 1
anoremenu icon=80th-disabled 960 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
tmenu ToolBar.80th 80th Column Indicator




function! g:Toggle_Toolbar_Fold()
    if !exists('g:toolbar_fold_state')
        let g:toolbar_fold_state = 2
    endif
    aunmenu ToolBar.Fold
    if g:toolbar_fold_state == 1
        let g:toolbar_fold_state = 2
        anoremenu icon=fold-enabled 970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
        set foldcolumn=4
        echo "On"
    else
        let g:toolbar_fold_state = 1
        anoremenu icon=fold-disabled 970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
        set foldcolumn=0
        echo "Off"
    endif
	tmenu ToolBar.Fold Toggle Fold Column
endfunction

let g:toolbar_fold_state = 1
anoremenu icon=fold-disabled 970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
tmenu ToolBar.Fold Toggle Fold Column



set lcs+=tab:>-
function! g:Toggle_Toolbar_Hidden()
	if !exists('g:toolbar_hidden_state')
		let g:toolbar_hidden_state = 2
	endif
	aunmenu ToolBar.Hidden
	if g:toolbar_hidden_state == 1
		let g:toolbar_hidden_state = 2
		anoremenu icon=hidden-enabled 980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>

		"set lcs+=eol:¶,tab:
		set lcs=tab:▸·,eol:¬,nbsp:_
		set isprint=
		syn match blort "[^[:print:]]"
		hi link blort NonText
		set list

		echo "On"
	else
		let g:toolbar_hidden_state = 1
		anoremenu icon=hidden-disabled 980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>

		syn clear blort
		set isprint=@,~-159,161-255
		set nolist

		echo "Off"
	endif
	tmenu ToolBar.Hidden Toggle Hidden Chars
endfunction

let g:toolbar_hidden_state = 1
anoremenu icon=hidden-disabled 980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>
tmenu ToolBar.Hidden Toggle Hidden Chars


function! g:Toggle_Toolbar_Cursor()
	if !exists('g:toolbar_cursor_state')
		let g:toolbar_cursor_state = 2
	endif
	aunmenu ToolBar.Cursor
	if g:toolbar_cursor_state == 1
		let g:toolbar_cursor_state = 2
		anoremenu icon=cursor-none 990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>

		set nocursorcolumn
		set nocursorline

		echo "Off"
	elseif g:toolbar_cursor_state == 2
		let g:toolbar_cursor_state = 3
		anoremenu icon=cursor-horiz 990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>

		set nocursorcolumn
		set cursorline

		echo "Line"
    else
		let g:toolbar_cursor_state = 1
		anoremenu icon=cursor-both 990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>

		set cursorcolumn
		set cursorline

		echo "Line & Column"
	endif
	tmenu ToolBar.Cursor Change Cursor Highlighting
endfunction

let g:toolbar_cursor_state = 1
anoremenu icon=cursor-none 990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>
tmenu ToolBar.Cursor Change Cursor Highlighting




" ¶ ˽
"


