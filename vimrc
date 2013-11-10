"---------------------------
" 	vim常规设置
"---------------------------
set nobackup 			" 不生成备份文件
set autoread			" 文件在Vim之外修改过，自动重新读入
set autochdir           " 自动切换当前目录为当前文件所在的目录
set nocompatible		" 不要使用vi的键盘模式，而是vim自己的
  	
set showcmd				" 在命令行显示当前输入的命令
set wildmenu			" 增强模式中的命令行自动完成操作
set wildignore=*.o,*~,*.pyc,*.class,*.swp" Ignore compiled files

set ruler               " 在右下角显示光标位置的状态行
set laststatus=2 		" always show the status line

" 主题和颜色
syntax enable
set background=dark
colorscheme solarized
set t_Co=256

" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936



"---------------------------
"  	格式控制和语法类
"---------------------------
set smartindent 		" 智能对齐方式
set autoindent 			" 自动对齐
set tabstop=4			" 设置Tab为四个空格
set shiftwidth=4		" 自动缩进
set noexpandtab			" 不要Tab键使用空格键替代
set nowrap				" 不要换行
set number				" 开启行号显示
set cursorline          " 突出显示当前行
set scrolloff=7			" 上下滚动,始终在中间

filetype on				" 开启文件类型侦测
filetype plugin on		" 根据侦测到的不同类型加载对应的插件
filetype indent on		" 根据侦测到的不同类型采用不同的缩进格式
syntax on
syntax enable					" 开启语法高亮
set completeopt=longest,menu	" 自动补全设置
set foldmethod=syntax			" 选择代码折叠类型
set foldlevel=100				" 启动vim时不要自动折叠代码
set showmatch           		" 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2         		" 短暂跳转到匹配括号的时间



"---------------------------
" 	搜索
"---------------------------
set hlsearch		" 开启高亮显示结果
set incsearch		" 开启实时搜索功能
set ignorecase 		" 搜索时忽略大小写


"---------------------------
" 	插件设置
"---------------------------
"vundle 
set rtp+=~/.vim/bundle/vundle/    "PATH
call vundle#rc()
Bundle 'tpope/vim-pathogen'
Bundle 'gmarik/vundle'
Bundle 'SirVer/ultisnips'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/winmanager'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe'


"YouCompleteMe 
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:SuperTabDefaultCompletionType = 'C-Tab>'

"pathogen.vim
execute pathogen#infect()

"powerline
set guifont=FZSXSLKJW\ for\ Powerline
let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'
set encoding=utf-8 " Necessary to show Unicode glyphs
"let g:Powerline_theme = 'solarized256'

"ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|swp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"let g:ctrlp_user_command = 'find %s -type f'


"Tlist
let Tlist_File_Fold_Auto_Close=0
let Tlist_Auto_Open=0
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
let Tlist_WinHeight = 40

"NERDTree
let g:NERDTree_title = '[NERD Tree]'
function! NERDTree_Start() 
	exe 'NERDTree' 
endfunction 
function! NERDTree_IsValid() 
	return 1 
endfunction
"NERDTree-auto close nerdtree when vim quit
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			elseif winnr("$") == 2
				if bufwinnr("__Tag_List__") != -1
					q
				endif
			endif
		endif
	endif
endfunction

"winManager
let g:winManagerWindowLayout='NERDTree|TagList' 
let g:winManagerWidth = 30

func ToggleWM()
if IsWinManagerVisible()
	exec "WMToggle"
else
	exec "WMToggle"
	exec "q"
endif
endfunc

nnoremap <F3> :call ToggleWM()<CR>
autocmd VimEnter *.c,*.h,*.cpp call ToggleWM() 


"---------------------------
" 	键盘映射和快捷键
"---------------------------

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠
nnoremap <C-w> <C-w>w				" 设置切换窗口快捷键

"tab选项卡快捷键
nnoremap <C-t> :tabnew<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-x> :tabclose<CR>


"按F5 编译当前文件
func Compile()
if &filetype == 'c'
exec "w"
exec "!gcc % -g -o %<"
endif
endfunc
map <F5> :call Compile()<CR>

"按F6 执行
map <F6> :call Run()<CR>
func Run()
if &filetype == 'c'
exec "!./%<"
endif
if &filetype == 'python'
exec "w"
exec "!python %"
endif
endfunc

map <F4> :call UpdateTags()<CR>
func UpdateTags()
exec "!ctags -R ."
endfunc
