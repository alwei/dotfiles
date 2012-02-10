"=============================================================================
"    Description: .vimrcサンプル設定
"         Author: anonymous
"  Last Modified: 0000-00-00 07:03
"        Version: 0.00
"=============================================================================
set nocompatible
scriptencoding cp932
" scriptencodingと、このファイルのエンコーディングが一致するよう注意！
" scriptencodingは、vimの内部エンコーディングと同じものを推奨します。
" 改行コードは set fileformat=unix に設定するとunixでも使えます。

" Windowsで内部エンコーディングを cp932以外にしていて、
" 環境変数に日本語を含む値を設定したい場合は Let を使用します。
" Letは vimrc(オールインワンパッケージの場合)と encode.vim で定義されます。
" Let $HOGE=$USERPROFILE.'/ほげ'

"----------------------------------------
" ユーザーランタイムパス設定
"----------------------------------------
"Windows, unixでのruntimepathの違いを吸収するためのもの。
"$MY_VIMRUNTIMEはユーザーランタイムディレクトリを示す。
":echo $MY_VIMRUNTIMEで実際のパスを確認できます。
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

"ランタイムパスを通す必要のあるプラグインを使用する場合、
"$MY_VIMRUNTIMEを使用すると Windows/Linuxで切り分ける必要が無くなります。
"例) vimfiles/qfixapp (Linuxでは~/.vim/qfixapp)にランタイムパスを通す場合
"set runtimepath+=$MY_VIMRUNTIME/qfixapp

"----------------------------------------
" 内部エンコーディング指定
"----------------------------------------
"内部エンコーディングのUTF-8化と文字コードの自動認識設定をencode.vimで行う。
"オールインワンパッケージの場合 vimrcで設定されます。
"エンコーディング指定や文字コードの自動認識設定が適切に設定されている場合、
"次行の encode.vim読込部分はコメントアウトして下さい。
silent! source $MY_VIMRUNTIME/pluginjp/encode.vim
"scriptencodingと異なる内部エンコーディングに変更する場合、
"変更後にもscriptencodingを指定しておくと問題が起きにくくなります。
scriptencoding cp932

"----------------------------------------
" システム設定
"----------------------------------------
"ファイルの上書きの前にバックアップを作る/作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set nowritebackup
"バックアップ/スワップファイルを作成する/しない
set nobackup
if version >= 703
  "再読込、vim終了後も継続するアンドゥ(7.3)
  "set undofile
  "アンドゥの保存場所(7.3)
  "set undodir=.
endif
set backupdir=~/.vimbackup
let &directory = &backupdir
"set noswapfile
"viminfoを作成しない
"set viminfo=
"クリップボードを共有
set clipboard+=unnamed
"8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
"キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeoutlen=3500
"編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden
"ヒストリの保存数
set history=50
"日本語の行の連結時には空白を入力しない
set formatoptions+=mM
"Visual blockモードでフリーカーソルを有効にする
set virtualedit=block
"カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>
"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
"コマンドライン補完するときに強化されたものを使う
set wildmenu
"マウスを有効にする
if has('mouse')
  set mouse=a
endif
"pluginを使用可能にする
filetype plugin indent on
" vi互換モードの解除
set nocp
" HOMEへ移動
cd $HOME
" 文字エンコーディング
set encoding=utf-8
if has('win32') || has('win64')
  set termencoding=cp932
else
  set termencoding=utf-8
endif
set fileencoding=utf-8
" updatetimeを設定
set updatetime=500

""----------------------------------------
" 検索
"----------------------------------------
"検索の時に大文字小文字を区別する
set noignorecase
set nosmartcase
"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
"インクリメンタルサーチ
set incsearch
"検索文字の強調表示
set hlsearch
"w,bの移動で認識する文字
"set iskeyword=a-z,A-Z,48-57,_,.,-,>
"vimgrep をデフォルトのgrepとする場合internal
set grepprg=internal

"----------------------------------------
" 表示設定
"----------------------------------------
"スプラッシュ(起動時のメッセージ)を表示しない
set shortmess+=I
"エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell
set visualbell t_vb=
"マクロ実行中などの画面再描画を行わない
"set lazyredraw
"Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash
"行番号表示
set number
if version >= 703
  "相対行番号表示(7.3)
  "set relativenumber
endif
"括弧の対応表示時間
set showmatch matchtime=1
"タブを設定
"set ts=4 sw=4 sts=4
"自動的にインデントする
set autoindent
"Cインデントの設定
set cindent
set cinoptions+=:0,g0
"タイトルを表示
set title
"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=2
set laststatus=2
"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline
"Tab、行末の半角スペースを明示的に表示する
" set list
" set listchars=tab:->

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

" インデント幅
set shiftwidth=2
" タブの画面上での幅
set tabstop=2
" タブをスペースに展開
set expandtab
" オムニ補完でプレビューウィンドウを表示しない
set completeopt=longest,menu
" 長い行を折り返さず表示
set wrap
" 改行時の自動コメント挿入のオフ
autocmd FileType * setlocal formatoptions-=ro

""""""""""""""""""""""""""""""
"ステータスラインに文字コード等表示
"iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
""""""""""""""""""""""""""""""
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
endif

"FencB() : カーソル上の文字コードをエンコードに応じた表示にする
function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

"----------------------------------------
" diff/patch
"----------------------------------------
"diffの設定
if has('win32') || has('win64')
  set diffexpr=MyDiff()
  function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let cmd = '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    silent execute cmd
  endfunction
endif

"現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
"パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

"----------------------------------------
" ノーマルモード
"----------------------------------------
"ヘルプ検索
" nnoremap <F1> K
"現在開いているvimスクリプトファイルを実行
nnoremap <F8> :source %<CR>
"強制全保存終了を無効化
nnoremap ZZ <Nop>
"カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
"キーボードマクロには物理行移動を推奨
"h l は行末、行頭を超えることが可能に設定(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
"l を <Right>に置き換えても、折りたたみを l で開くことができるようにする
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif

" インサートモード、コマンドモード時はEmacsキーバインドを使う
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" スペースキーを押した時、中心を保ってスクロール
nnoremap <Space> jzz
nnoremap <S-Space> kzz
" モード切替時にIMEを自動オフ
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
" vimrcとgvimrcを再設定するための設定
if has('win32') || has('win64')
  nnoremap <silent> <Space>ev :<C-u>edit ~/Dropbox/dotfile/.vimrc<CR>
  nnoremap <silent> <Space>eg :<C-u>edit ~/Dropbox/dotfile/.gvimrc<CR>
else
  nnoremap <silent> <Space>ev :<C-u>edit ~/Dropbox/dotfile/.vimrc<CR>
  nnoremap <silent> <Space>eg :<C-u>edit ~/Dropbox/dotfile/.gvimrc<CR>
endif
" 入力で空行の挿入
nnoremap <CR> o<ESC>

"----------------------------------------
" 挿入モード
"----------------------------------------

"----------------------------------------
" ビジュアルモード
"----------------------------------------

"----------------------------------------
" コマンドモード
"----------------------------------------

"----------------------------------------
" Vimスクリプト
"----------------------------------------
""""""""""""""""""""""""""""""
"ファイルを開いたら前回のカーソル位置へ移動
"$VIMRUNTIME/vimrc_example.vim
""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインのカラー変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
" if has('unix') && !has('gui_running')
"   " ESCですぐに反映されない対策
"   inoremap <silent> <ESC> <ESC>
" endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
    redraw
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので、scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"強調表示されない場合、ここでscriptencodingを指定するとうまくいく事があります。
"scriptencoding cp932
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  "全角スペースを明示的に表示する
  silent! match ZenkakuSpace /　/
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif

""""""""""""""""""""""""""""""
"grep,tagsのためカレントディレクトリをファイルと同じディレクトリに移動する
""""""""""""""""""""""""""""""
"if exists('+autochdir')
"  "autochdirがある場合カレントディレクトリを移動
"  set autochdir
"else
"  "autochdirが存在しないが、カレントディレクトリを移動したい場合
"  au BufEnter * execute ":silent! lcd " . escape(expand("%:p:h"), ' ')
"endif

"----------------------------------------
" 各種プラグイン設定
"----------------------------------------
" Vundle
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.bundle/neobundle.vim
  call neobundle#rc(expand('~/.bundle'))
endif

" 利用中のプラグインをBundle
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/unite-build'
NeoBundle 'Shougo/neocomplcache-clang'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'osyo-manga/neocomplcache-clang_complete'
NeoBundle 'osyo-manga/vim-cpp11-syntax'
NeoBundle 'osyo-manga/unite-kakizome'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-vcs'
NeoBundle 'tyru/skk.vim'
" NeoBundle 'tyru/eskk.vim'
NeoBundle 'tyru/restart.vim'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'taku-o/vim-toggle'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'gregsexton/VimCalc'
" NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'mattn/unite-advent_calendar'
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'basyura/webapi-vim'
NeoBundle 'toritori0318/vim-redmine'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Conque-Shell'

filetype plugin indent on

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 5000
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 2
let g:neocomplcache_enable_ignore_case = &ignorecase
let g:neocomplcache_enable_smart_case = 0

if !exists('g:neocomplcache_delimiter_patterns')
let g:neocomplcache_delimiter_patterns= {}
endif
let g:neocomplcache_delimiter_patterns.cpp = ['::']

if !exists('g:neocomplcache_omni_patterns')
let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

if !exists('g:neocomplcache_include_paths')
let g:neocomplcache_include_paths = {}
endif

if has('win32') || has('win64')
  let g:neocomplcache_include_paths.cpp = "C:/MinGW/lib/gcc/mingw32/4.5.2/include/c++,C:/MinGW/include,C:/MinGW/include/boost"
else
  let g:neocomplcache_include_paths.cpp = "/usr/include"
endif

if !exists('g:neocomplcache_member_prefix_patterns')
let g:neocomplcache_member_prefix_patterns = {}
endif
call neocomplcache#set_dictionary_helper(g:neocomplcache_member_prefix_patterns, 'c,cpp,objc,objcpp', '\.\|->')

let g:neocomplcache_snippets_dir = '~/.snippets'
let g:neocomplcache_snippets_disable_runtime_snippets = 0

if has('win32') || has('win64')
  set path+=C:/MinGW/include
  set path+=C:/MinGW/lib/gcc/mingw32/4.5.2/include
endif

" neocomplcache map
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
imap <C-q> <Plug>(neocomplcache_start_unite_quick_match)

if has('win32') || has('win64')
let g:clang_use_library = 1
  let g:clang_library_path = 'C:/MinGW/bin'
  let g:clang_user_options =
        \ '-IC:/MinGW/lib/gcc/mingw32/4.5.2/include/ '.
        \ '-IC:/MinGW/include '.
        \ '-fms-extensions -fgnu-runtime '.
        \ '-include malloc.h '
  let g:clang_complete_auto = 1
  let g:neocomplcache_force_overwrite_completefunc = 1
elseif has('macunix')
  let g:neocomplcache_clang_use_library = 1
  let g:neocomplcache_clang_library_path = '/usr/share/clang'
  let g:neocomplcache_clang_user_options = 
        \ '-I/usr/include '.
        \ '-fms-extensions -fgnu-runtime '.
        \ '-include malloc.h '
  let g:neocomplcache_force_overwrite_completefunc = 1
else
  let g:clang_use_library = 1
  let g:clang_library_path = '/usr/share/clang'
  let g:clang_user_options =
        \ '-I/usr/include '.
        \ '-fms-extensions -fgnu-runtime '.
        \ '-include malloc.h '
  let g:clang_complete_auto = 1
  let g:neocomplcache_force_overwrite_completefunc = 1
endif

" vimshell
let g:vimshell_interactive_update_time = 10
let g:vimshell_disable_escape_highlight = 1

if has('mac')
  let g:vimshell_prompt = $USER."% "
elseif has('win32') || has('win64') || has('unix')
  let g:vimshell_prompt = $USERNAME."% "
endif

" vimshell map
nnoremap <silent> ,vs :VimShell<CR>
nnoremap <silent> ,vcs :VimShellCreate<CR>
nnoremap <silent> ,vp :VimShellPop<CR>

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_sort_type = 'filename'
let g:vimfiler_enable_clipboard = 1
let g:vimfiler_safe_mode_by_default = 0

" vimfiler map
nnoremap <silent> ,vf :VimFiler<CR>
nnoremap <silent> ,vcf :VimFilerCreate<CR>

" unite.vim
let g:unite_source_file_mru_limit = 200
let g:unite_enable_start_insert = 0
let g:unite_source_file_mru_filename_format = ''
let g:unite_source_grep_default_opts = '-iRHn'

" unite.vim map
nnoremap [unite] <Nop>
nmap , [unite]
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1

" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>

" quickhl.vim map
nmap <Space>m <Plug>(quickhl-toggle)
xmap <Space>m <Plug>(quickhl-toggle)
nmap <Space>M <Plug>(quickhl-reset)
xmap <Space>M <Plug>(quickhl-reset)
"nmap <Space>j <Plug>(quickhl-match)

" skk.vim
map! <C-j> <Plug>(skk-toggle-im)
let g:skk_large_jisyo = expand('~/.skk/SKK-JISYO.L')
let g:skk_auto_save_jisyo = 1
set imdisable

" eskk.vim
" let g:eskk#directory = "~/.skk"
" let g:eskk#dictionary = { 'path': "~/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
" let g:eskk#large_dictionary = { 'path': "~/.skk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
" let g:eskk#enable_completion = 1
" let g:eskk#egg_like_newline_completion = 1
" set imdisable

" restart.vim
nnoremap <Space>rs :Restart<CR>

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

" C++11 syntax
let g:c_no_curly_error = 1

" ref.vim
nmap ,ra :<C-u>Ref alc<Space>

" lynx.exe の絶対パス
if has('win32') || has('win64')
  let s:lynx = $VIM."/lynx.exe"
  let s:cfg = $VIM."/lynx.cfg"
  let g:ref_alc_cmd = s:lynx.' -cfg='.s:cfg.' -dump %s'
  let g:ref_alc_start_linenumber = 39
  let g:ref_alc_encoding = 'Shift-JIS'
else
endif

" open-browser.vim
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)

" TweetVim
nnoremap <silent> ,tl :TweetVimHomeTimeline<CR>
nnoremap <silent> ,tr :TweetVimMentions<CR>
nnoremap <silent> ,ts :TweetVimSay<CR>
nnoremap <silent> ,tu :Unite tweetvim<CR>
if !exists('g:neocomplcache_dictionary_filetype_lists')
  let g:neocomplcache_dictionary_filetype_lists = {}
endif
let neco_dic = g:neocomplcache_dictionary_filetype_lists
let neco_dic.tweetvim_say = $HOME . '/.tweetvim/screen_name'
let g:tweetvim_tweet_per_page = 50
let g:tweetvim_cache_size = 10
let g:tweetvim_config_dir = expand('~/.tweetvim')

"----------------------------------------
" その他処理
"----------------------------------------
" fullscreenのToggle
nnoremap ,tf :call ToggleFullScreen()<CR>
function! ToggleFullScreen()
  if &guioptions =~# 'C'
    set guioptions-=C
    if exists('s:go_temp')
      if s:go_temp =~# 'm'
        set guioptions+=m
      endif
      if s:go_temp =~# 'T'
        set guioptions+=T
      endif
    endif
    simalt ~r
  else
    let s:go_temp = &guioptions
    set guioptions-=C
    set guioptions-=m
    set guioptions-=T
    simalt ~x
  endif
endfunction

" AllMaps
command!
\   -nargs=* -complete=mapping
\   AllMaps
\   map <args> | map! <args> | lmap <args>

" Linux環境でのクリップボードコピー
if has('unix')
  vnoremap y "+y
  imap <C-I> <ESC>"*pa
endif
