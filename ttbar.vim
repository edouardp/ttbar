
"amenu 950 ToolBar.-SEP950- :<CR>
aunmenu ToolBar
set toolbariconsize=medium



function! g:Toggle_Toolbar_Nerdtree()
    if !exists('g:toolbar_nerdtree_state')
        let g:toolbar_nerdtree_state = 2
    endif
    aunmenu ToolBar.NERDTree
    if g:toolbar_nerdtree_state == 1
        let g:toolbar_nerdtree_state = 2
        anoremenu icon=nerdtree-on 1.950 ToolBar.NERDTree :call g:Toggle_Toolbar_Nerdtree()<CR>
        NERDTreeToggle
        echo "NERDTree On"
    else
        let g:toolbar_nerdtree_state = 1
        anoremenu icon=nerdtree-off 1.950 ToolBar.NERDTree :call g:Toggle_Toolbar_Nerdtree()<CR>
        NERDTreeToggle
        echo "NERDTree Off"
    endif
    tmenu ToolBar.NERDTree Toggle NERDTree
endfunction

let g:toolbar_nerdtree_state = 1
anoremenu icon=nerdtree-off 1.950 ToolBar.NERDTree :call g:Toggle_Toolbar_Nerdtree()<CR>
tmenu ToolBar.NERDTree Toggle NERDTree


function! g:Toggle_Toolbar_Fold()
    if !exists('g:toolbar_fold_state')
        let g:toolbar_fold_state = 2
    endif
    aunmenu ToolBar.Fold
    if g:toolbar_fold_state == 1
        let g:toolbar_fold_state = 2
        anoremenu icon=fold-enabled 1.970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
        set foldcolumn=4
        echo "On"
    else
        let g:toolbar_fold_state = 1
        anoremenu icon=fold-disabled 1.970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
        set foldcolumn=0
        echo "Off"
    endif
    tmenu ToolBar.Fold Toggle Fold Column
endfunction

let g:toolbar_fold_state = 1
anoremenu icon=fold-disabled 1.970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
tmenu ToolBar.Fold Toggle Fold Column


set lcs+=tab:>-
function! g:Toggle_Toolbar_Hidden()
    if !exists('g:toolbar_hidden_state')
        let g:toolbar_hidden_state = 2
    endif
    aunmenu ToolBar.Hidden
    if g:toolbar_hidden_state == 1
        let g:toolbar_hidden_state = 2
        anoremenu icon=hidden-enabled 1.980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>

        "set lcs+=eol:¶,tab:
        set lcs=tab:▸·,eol:¬,nbsp:_
        set isprint=
        syn match blort "[^[:print:]]"
        hi link blort NonText
        set list

        echo "On"
    else
        let g:toolbar_hidden_state = 1
        anoremenu icon=hidden-disabled 1.980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>

        syn clear blort
        set isprint=@,~-159,161-255
        set nolist

        echo "Off"
    endif
    tmenu ToolBar.Hidden Toggle Hidden Chars
endfunction

let g:toolbar_hidden_state = 1
anoremenu icon=hidden-disabled 1.980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>
tmenu ToolBar.Hidden Toggle Hidden Chars


function! g:Toggle_Toolbar_Cursor()
    if !exists('g:toolbar_cursor_state')
        let g:toolbar_cursor_state = 2
    endif
    aunmenu ToolBar.Cursor
    if g:toolbar_cursor_state == 1
        let g:toolbar_cursor_state = 2
        anoremenu icon=cursor-none 1.990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>

        set nocursorcolumn
        set nocursorline

        echo "Off"
    elseif g:toolbar_cursor_state == 2
        let g:toolbar_cursor_state = 3
        anoremenu icon=cursor-horiz 1.990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>

        set nocursorcolumn
        set cursorline

        echo "Line"
    else
        let g:toolbar_cursor_state = 1
        anoremenu icon=cursor-both 1.990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>

        set cursorcolumn
        set cursorline

        echo "Line & Column"
    endif
    tmenu ToolBar.Cursor Change Cursor Highlighting
endfunction

let g:toolbar_cursor_state = 2
anoremenu icon=cursor-none 1.990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>
tmenu ToolBar.Cursor Change Cursor Highlighting


function! g:Toggle_Toolbar_80th()
    if !exists('g:toolbar_80th_state')
        let g:toolbar_80th_state = 2
    endif
    aunmenu ToolBar.80th
    if g:toolbar_80th_state == 1
        let g:toolbar_80th_state = 2
        anoremenu icon=80th-enabled 1.995 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
        set colorcolumn=80
        echo "On"
    else
        let g:toolbar_80th_state = 1
        anoremenu icon=80th-disabled 1.995 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
        set colorcolumn=0
        echo "Off"
    endif
    tmenu ToolBar.80th 80th Column Indicator
endfunction

let g:toolbar_80th_state = 1
anoremenu icon=80th-disabled 1.995 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
tmenu ToolBar.80th 80th Column Indicator


function! g:Toggle_Toolbar_Tagbar()
    if !exists('g:toolbar_tagbar_state')
        let g:toolbar_tagbar_state = 2
    endif
    aunmenu ToolBar.Tagbar
    if g:toolbar_tagbar_state == 1
        let g:toolbar_tagbar_state = 2
        anoremenu icon=Tagbar-on 1.998 ToolBar.Tagbar :call g:Toggle_Toolbar_Tagbar()<CR>
        TagbarToggle
        echo "Tagbar On"
    else
        let g:toolbar_tagbar_state = 1
        anoremenu icon=Tagbar-off 1.998 ToolBar.Tagbar :call g:Toggle_Toolbar_Tagbar()<CR>
        TagbarToggle
        echo "Tagbar Off"
    endif
    tmenu ToolBar.Tagbar Toggle Tagbar
endfunction

let g:toolbar_tagbar_state = 1
anoremenu icon=Tagbar-off 1.998 ToolBar.Tagbar :call g:Toggle_Toolbar_Tagbar()<CR>
tmenu ToolBar.Tagbar Toggle Tagbar



function! g:Toggle_Toolbar_Zoomwin()
    if !exists('g:toolbar_zoomwin_state')
        let g:toolbar_zoomwin_state = 2
    endif
    aunmenu ToolBar.Zoomwin
    if g:toolbar_zoomwin_state == 1
        let g:toolbar_zoomwin_state = 2
        anoremenu icon=Zoomwin-on 1.999 ToolBar.Zoomwin :call g:Toggle_Toolbar_Zoomwin()<CR>
        ZoomWin
        echo "Zoomwin On"
    else
        let g:toolbar_zoomwin_state = 1
        anoremenu icon=Zoomwin-off 1.999 ToolBar.Zoomwin :call g:Toggle_Toolbar_Zoomwin()<CR>
        ZoomWin
        echo "Zoomwin Off"
    endif
    tmenu ToolBar.Zoomwin Toggle Zoomwin
endfunction

let g:toolbar_zoomwin_state = 1
anoremenu icon=Zoomwin-off 1.999 ToolBar.Zoomwin :call g:Toggle_Toolbar_Zoomwin()<CR>
tmenu ToolBar.Zoomwin Toggle Zoomwin
