
"amenu 950 ToolBar.-SEP950- :<CR>
aunmenu ToolBar
if has('mac') || has('unix')
    set toolbariconsize=medium
endif


function! g:Toggle_Toolbar_Nerdtree()
    if !exists('g:toolbar_nerdtree_state')
        let g:toolbar_nerdtree_state = 2
    endif
    aunmenu ToolBar.NERDTree
    if g:toolbar_nerdtree_state == 1
        let g:toolbar_nerdtree_state = 2
        anoremenu icon=nerdtree-on 1.950 ToolBar.NERDTree :call g:Toggle_Toolbar_Nerdtree()<CR>
        NERDTree
        echo "NERDTree On"
    else
        let g:toolbar_nerdtree_state = 1
        anoremenu icon=nerdtree-off 1.950 ToolBar.NERDTree :call g:Toggle_Toolbar_Nerdtree()<CR>
        NERDTreeClose
        echo "NERDTree Off"
    endif
    tmenu ToolBar.NERDTree Toggle NERDTree
endfunction

let g:toolbar_nerdtree_state = 1
anoremenu icon=nerdtree-off 1.950 ToolBar.NERDTree :call g:Toggle_Toolbar_Nerdtree()<CR>
tmenu ToolBar.NERDTree Toggle NERDTree



function! g:Display_Toolbar_Fold()
    aunmenu ToolBar.Fold
    if &foldcolumn
        anoremenu <silent> icon=fold-enabled 1.970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
    else
        anoremenu <silent> icon=fold-disabled 1.970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
    endif
    tmenu ToolBar.Fold Toggle Fold Column
endfunction

function! g:Toggle_Toolbar_Fold()
    if &foldcolumn
        set foldcolumn=0
        call g:Display_Toolbar_Fold()
        echo "Fold Column Off"
    else
        set foldcolumn=4
        call g:Display_Toolbar_Fold()
        echo "Fold Column On"
    endif
endfunction

anoremenu icon=fold-enabled 1.970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
tmenu ToolBar.Fold Toggle Fold Column



function! g:Display_Toolbar_Number()
    aunmenu ToolBar.Number
    if !&number && !&relativenumber
        anoremenu <silent> icon=number-none 1.975 ToolBar.Number :call g:Toggle_Toolbar_Number()<CR>
    elseif &number && !&relativenumber
        anoremenu <silent> icon=number-number 1.975 ToolBar.Number :call g:Toggle_Toolbar_Number()<CR>
    elseif !&number && &relativenumber
        anoremenu <silent> icon=number-relative 1.975 ToolBar.Number :call g:Toggle_Toolbar_Number()<CR>
    elseif &number && &relativenumber
        anoremenu <silent> icon=number-both 1.975 ToolBar.Number :call g:Toggle_Toolbar_Number()<CR>
    endif
    tmenu ToolBar.Number Toggle Number Column
endfunction

function! g:Toggle_Toolbar_Number()
    if !&number && !&relativenumber
        set number
        set norelativenumber
        call g:Display_Toolbar_Number()
        echo "Numbers On"
    elseif &number && !&relativenumber
        set nonumber
        set relativenumber
        call g:Display_Toolbar_Number()
        echo "Relative Numbers On"
    elseif !&number && &relativenumber
        set number
        set relativenumber
        call g:Display_Toolbar_Number()
        echo "Relative Numbers + Line On"
    elseif &number && &relativenumber
        set nonumber
        set norelativenumber
        call g:Display_Toolbar_Number()
        echo "Numbers Off"
    endif
endfunction

anoremenu icon=number-none 1.975 ToolBar.Number :call g:Toggle_Toolbar_Number()<CR>
tmenu ToolBar.Number Toggle Number Column



function! g:Display_Toolbar_Hidden()
    aunmenu ToolBar.Hidden
    if &list
        anoremenu <silent> icon=hidden-enabled 1.980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>
    else
        anoremenu <silent> icon=hidden-disabled 1.980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>
    endif
    tmenu ToolBar.Hidden Toggle Fold Column
endfunction


set lcs+=tab:>-
function! g:Toggle_Toolbar_Hidden()
    if !&list
        "set lcs+=eol:¶,tab:
        set lcs=tab:▸·,eol:¬,nbsp:_
        set isprint=
        syn match blort "[^[:print:]]"
        hi link blort NonText
        set list

        call g:Display_Toolbar_Hidden()
        echo "Hidden Characters On"
    else
        syn clear blort
        set isprint=@,~-159,161-255
        set nolist

        call g:Display_Toolbar_Hidden()
        echo "Hidden Characters Off"
    endif
endfunction

anoremenu icon=hidden-disabled 1.980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>
tmenu ToolBar.Hidden Toggle Hidden Chars



function! g:Display_Toolbar_Cursor()
    aunmenu ToolBar.Cursor
    if !&cursorline && !&cursorcolumn
        anoremenu icon=cursor-none 1.990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>
    elseif &cursorline && !&cursorcolumn
        anoremenu icon=cursor-horiz 1.990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>
    elseif &cursorline && &cursorcolumn
        anoremenu icon=cursor-both 1.990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>
    endif
    tmenu ToolBar.Cursor Change Cursor Highlighting
endfunction

function! g:Toggle_Toolbar_Cursor()
    if !&cursorline && !&cursorcolumn
        set nocursorcolumn
        set cursorline
        call g:Display_Toolbar_Cursor()
        echo "Cursor Highlight: Line"
    elseif &cursorline && !&cursorcolumn
        set cursorcolumn
        set cursorline
        call g:Display_Toolbar_Cursor()
        echo "Cursor Highlight: Line & Column"
    elseif &cursorline && &cursorcolumn
        set nocursorcolumn
        set nocursorline
        call g:Display_Toolbar_Cursor()
        echo "Cursor Highlighting Off"
    endif
endfunction

anoremenu icon=cursor-none 1.990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>
tmenu ToolBar.Cursor Change Cursor Highlighting



function! g:Display_Toolbar_80th()
    aunmenu ToolBar.80th
    if &colorcolumn
        anoremenu <silent> icon=80th-enabled 1.995 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
    else
        anoremenu <silent> icon=80th-disabled 1.995 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
    endif
    tmenu ToolBar.80th 80th Column Indicator
endfunction

function! g:Toggle_Toolbar_80th()
    if &colorcolumn
        set colorcolumn=0
        call g:Display_Toolbar_80th()
        echo "80th Column Indicator Off"
    else
        set colorcolumn=80
        call g:Display_Toolbar_80th()
        echo "80th Column Indicator On"
    endif
endfunction

anoremenu icon=80th-disabled 1.995 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
tmenu ToolBar.80th 80th Column Indicator



function! g:Display_Window_Toolbar()
    call g:Display_Toolbar_Fold()
    call g:Display_Toolbar_Number()
    call g:Display_Toolbar_Hidden()
    call g:Display_Toolbar_Cursor()
    call g:Display_Toolbar_80th()
endfunction

autocmd! WinEnter * call g:Display_Window_Toolbar()



function! g:Toggle_Toolbar_Matchmaker()
    if !exists('g:toolbar_matchmaker_state')
        let g:toolbar_matchmaker_state = 2
    endif
    aunmenu ToolBar.Matchmaker
    if g:toolbar_matchmaker_state == 1
        let g:toolbar_matchmaker_state = 2
        anoremenu icon=matchmaker-on 1.996 ToolBar.Matchmaker :call g:Toggle_Toolbar_Matchmaker()<CR>
        Matchmaker
        echo "Matchmaker On"
    else
        let g:toolbar_matchmaker_state = 1
        anoremenu icon=matchmaker-off 1.996 ToolBar.Matchmaker :call g:Toggle_Toolbar_Matchmaker()<CR>
        Matchmaker!
        echo "Matchmaker Off"
    endif
    tmenu ToolBar.Matchmaker Toggle Matchmaker
endfunction

let g:toolbar_matchmaker_state = 1
anoremenu icon=matchmaker-off 1.996 ToolBar.Matchmaker :call g:Toggle_Toolbar_Matchmaker()<CR>
tmenu ToolBar.Matchmaker Toggle Matchmaker



function! g:Toggle_Toolbar_Tagbar()
    if !exists('g:toolbar_tagbar_state')
        let g:toolbar_tagbar_state = 2
    endif
    aunmenu ToolBar.Tagbar
    if g:toolbar_tagbar_state == 1
        let g:toolbar_tagbar_state = 2
        anoremenu icon=tagbar-on 1.998 ToolBar.Tagbar :call g:Toggle_Toolbar_Tagbar()<CR>
        TagbarToggle
        echo "Tagbar On"
    else
        let g:toolbar_tagbar_state = 1
        anoremenu icon=tagbar-off 1.998 ToolBar.Tagbar :call g:Toggle_Toolbar_Tagbar()<CR>
        TagbarToggle
        echo "Tagbar Off"
    endif
    tmenu ToolBar.Tagbar Toggle Tagbar
endfunction

let g:toolbar_tagbar_state = 1
anoremenu icon=tagbar-off 1.998 ToolBar.Tagbar :call g:Toggle_Toolbar_Tagbar()<CR>
tmenu ToolBar.Tagbar Toggle Tagbar



function! g:Toggle_Toolbar_Zoomwin()
    if !exists('g:toolbar_zoomwin_state')
        let g:toolbar_zoomwin_state = 2
    endif
    aunmenu ToolBar.Zoomwin
    if g:toolbar_zoomwin_state == 1
        let g:toolbar_zoomwin_state = 2
        anoremenu icon=zoomwin-on 1.999 ToolBar.Zoomwin :call g:Toggle_Toolbar_Zoomwin()<CR>
        ZoomWin
        echo "Zoomwin On"
    else
        let g:toolbar_zoomwin_state = 1
        anoremenu icon=zoomwin-off 1.999 ToolBar.Zoomwin :call g:Toggle_Toolbar_Zoomwin()<CR>
        ZoomWin
        echo "Zoomwin Off"
    endif
    tmenu ToolBar.Zoomwin Toggle Zoomwin
endfunction

let g:toolbar_zoomwin_state = 1
anoremenu icon=zoomwin-off 1.999 ToolBar.Zoomwin :call g:Toggle_Toolbar_Zoomwin()<CR>
tmenu ToolBar.Zoomwin Toggle Zoomwin






function! g:Display_Toolbar_IndentLines()
    aunmenu ToolBar.IndentLines
    if !exists("b:indentLine_enabled") && &shiftwidth == 2
        anoremenu icon=indentlines-2 1.977 ToolBar.IndentLines :call g:Toggle_Toolbar_IndentLines()<CR>
    elseif !exists("b:indentLine_enabled") && &shiftwidth == 4
        anoremenu icon=indentlines-4 1.977 ToolBar.IndentLines :call g:Toggle_Toolbar_IndentLines()<CR>
    elseif !exists("b:indentLine_enabled")
        anoremenu icon=indentlines-4 1.977 ToolBar.IndentLines :call g:Toggle_Toolbar_IndentLines()<CR>
    elseif exists("b:indentLine_enabled") && b:indentLine_enabled == 1 && &shiftwidth == 2
        anoremenu icon=indentlines-2 1.977 ToolBar.IndentLines :call g:Toggle_Toolbar_IndentLines()<CR>
    elseif exists("b:indentLine_enabled") && b:indentLine_enabled == 1 && &shiftwidth == 4
        anoremenu icon=indentlines-4 1.977 ToolBar.IndentLines :call g:Toggle_Toolbar_IndentLines()<CR>
    elseif exists("b:indentLine_enabled") && b:indentLine_enabled == 1 
        anoremenu icon=indentlines-4 1.977 ToolBar.IndentLines :call g:Toggle_Toolbar_IndentLines()<CR>
    elseif exists("b:indentLine_enabled") && b:indentLine_enabled == 0 
        anoremenu icon=indentlines-off 1.977 ToolBar.IndentLines :call g:Toggle_Toolbar_IndentLines()<CR>
    endif
    tmenu ToolBar.IndentLines Switch IndentLines Settings
endfunction

function! g:Toggle_Toolbar_IndentLines()
    if !exists("b:indentLine_enabled") && &shiftwidth == 2
        IndentLinesReset 4
        call g:Display_Toolbar_IndentLines()
        echo "IndentLines On (4 spaces)"
    elseif !exists("b:indentLine_enabled") && &shiftwidth == 4
        IndentLinesDisable
        call g:Display_Toolbar_IndentLines()
        echo "IndentLines Off"
    elseif !exists("b:indentLine_enabled")
        IndentLinesDisable
        call g:Display_Toolbar_IndentLines()
        echo "IndentLines Off"
    elseif exists("b:indentLine_enabled") && b:indentLine_enabled == 1 && &shiftwidth == 2
        IndentLinesReset 4
        call g:Display_Toolbar_IndentLines()
        echo "IndentLines On (4 spaces)"
    elseif exists("b:indentLine_enabled") && b:indentLine_enabled == 1 && &shiftwidth == 4
        IndentLinesDisable
        call g:Display_Toolbar_IndentLines()
        echo "IndentLines Off"
    elseif exists("b:indentLine_enabled") && b:indentLine_enabled == 1 
        IndentLinesDisable
        call g:Display_Toolbar_IndentLines()
        echo "IndentLines Off"
    elseif exists("b:indentLine_enabled") && b:indentLine_enabled == 0 
        IndentLinesReset 2
        call g:Display_Toolbar_IndentLines()
        echo "IndentLines On (2 spaces)"
    endif
endfunction

anoremenu icon=indentlines-4 1.977 ToolBar.IndentLines :call g:Toggle_Toolbar_IndentLines()<CR>
tmenu ToolBar.IndentLines Change IndentLines

