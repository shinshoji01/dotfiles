" initial settings for Japanese characters
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

set clipboard+=unnamed

syntax on

" tab and indent
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
" set autoindent " 改行時に前の行のインデントを継続する
" set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
" set shiftwidth=4 " smartindentで増減する幅

" search
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR> " ESCキー2度押しでハイライトの切り替え

" cursor
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
set backspace=indent,eol,start " バックスペースキーの有効化

" blanket and % jump
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

" command supplement
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" mouse
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

" no indent while pasting from clip board
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" ------------------------------
" -------- NeoBundle -----------
" ------------------------------

if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'

"-----------------------------------------------
"---------------- plugins list -----------------

NeoBundle 'tomasr/molokai' " カラースキームmolokai
"NeoBundle 'kuroitu/pyceberg'

"-----------------------------------------------

NeoBundle 'itchyny/lightline.vim' " ステータスラインの表示内容強化
NeoBundle 'bronson/vim-trailing-whitespace' " visualize redundant while spaces
NeoBundle 'Yggdroot/indentLine' " visualize indent line
NeoBundle 'scrooloose/syntastic' " 構文エラーチェック
NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim' " プロジェクトに入ってるESLintを読み込む
"NeoBundle 'akiomik/git-gutter-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'cohama/lexima.vim' " blanket supplement
" NeoBundle 'ctrlpvim/ctrlp.vim' " 多機能セレクタ
" NeoBundle 'tacahiroy/ctrlp-funky' " CtrlPの拡張プラグイン. 関数検索
" NeoBundle 'suy/vim-ctrlp-commandline' " CtrlPの拡張プラグイン. コマンド履歴検索
" NeoBundle 'rking/ag.vim' " CtrlPの検索にagを使う

"-----------------------------------------------
"-----------------------------------------------
call neobundle#end()

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck

"---------------- molokai -----------------

if neobundle#is_installed('molokai') " molokaiがインストールされていれば
    colorscheme molokai " カラースキームにmolokaiを設定する
endif

"if neobundle#is_installed('pyceberg')
"    colorscheme pyceberg
"endif
set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける

"--------------- lightline ---------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

"--------------- syntastic ---------------
" 構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1

" Javascript用. 構文エラーチェックにESLintを使用
let g:syntastic_javascript_checkers=['eslint']
" Python用. 構文エラーチェックにpep8とpyflakesを使用
let g:syntastic_python_checkers=['pep8', 'pyflakes']
" Javascript, python以外は構文エラーチェックをしない
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['javascript', 'python'],
                           \ 'passive_filetypes': [] }

"--------------- command suppliment ---------------
autocmd FileType python setlocal completeopt-=preview
let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"
"let g:jedi#rename_command = "<c-r>"
let g:jedi#force_py_version="3"
