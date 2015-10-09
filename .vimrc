" This line should not be removed as it ensures that various options are
    " properly set to work with the Vim-related packages available in Debian.
    " debian.vim

    " Uncomment the next line to make Vim more Vi-compatible
    " NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
    " options, so any other options should be set AFTER setting 'compatible'.
    set nocompatible

    " Vim5 and later versions support syntax highlighting. Uncommenting the
    " following enables syntax highlighting by default.
    if has("syntax")
      syntax on            " 语法高亮
    endif
    colorscheme ron        " elflord ron peachpuff default 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim72/colors目录下

    " detect file type
    filetype on
    filetype plugin on

    set filetype=python
    au BufNewFile , BufRead *.py,*.pyw setf python

    " If using a dark background within the editing area and syntax highlighting
    " turn on this option as well
    set background=dark

    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
      "have Vim load indentation rules and plugins according to the detected filetype
      filetype plugin indent on
    endif

    " The following are commented out as they cause vim to behave a lot
    " differently from regular Vi. They are highly recommended though.

    "set ignorecase        " 搜索模式里忽略大小写
    "set smartcase        " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
    set autowrite        " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
    set autoindent        " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
    set smartindent        " 智能对齐方式
    set expandtab
    set tabstop=4        " 设置制表符(tab键)的宽度
    set softtabstop=4     " 设置软制表符的宽度 
    set shiftwidth=4    " (自动) 缩进使用的4个空格
    set cindent            " 使用 C/C++ 语言的自动缩进方式
    set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "设置C/C++语言的具体缩进方式
    "set backspace=2    " 设置退格键可用
    set showmatch        " 设置匹配模式，显示匹配的括号
    set linebreak        " 整词换行
    set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
    "set hidden " Hide buffers when they are abandoned
    set mouse=a            " Enable mouse usage (all modes)    "使用鼠标
    set number            " Enable line number    "显示行号
    "set previewwindow    " 标识预览窗口
    set history=50        " set command history to 50    "历史记录50条


    "--状态行设置--
    set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
    set ruler            " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。

    "--命令行设置--
    set showcmd            " 命令行显示输入的命令
    set showmode        " 命令行显示vim当前模式

    "--find setting--
    set incsearch        " 输入字符串就显示匹配点
    set hlsearch   

	set encoding=utf-8
	let &termencoding=&encoding
	set fileencodings=utf-8,gbk,utf-16,big5

	"--ctags setting--
	"    " 按下F5重新生成tag文件，并更新taglist
	       map <C-F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q.<CR><CR> :TlistUpdate<CR>
	            imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
	                set tags=tags
						set tags+=/usr/include/tags
						set tags+=/usr/include/c++/stltags/tags
						"set tags+=/home/lc/boost/boost_1_55_0/tags
						"set tags+=~/Hi3520D_Work/Hi3520D_SDK_V1.0.2.2/osdrv/kernel/linux-3.0.y/tags
						"set tags+=/usr/local/include/boost/tags
	                    set tags+=./tags "add current directory's generated tags file
                       " #set tags+=~/ip_netsdk/tags
                       "#set tags+=~/exm/include/tags
                       " #set tags+=~/exm/libsrc/tags
	"                        set tags+=~/arm/linux-2.6.24.7/tags "add new tags
	"                        file(刚刚生成tags的路径，在ctags -R
	"                        生成tags文件后，不要将tags移动到别的目录，否则ctrl+］时，会提示找不到源码文件)
    
	"-- omnicppcomplete setting --
	"    "
	"    按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
	        imap <F3> <C-X><C-O>
	"            " 按下F2根据头文件内关键字补全
	                imap <F2> <C-X><C-I>
	                set completeopt=menu,menuone "关掉智能补全时的预览窗口 "     
					let OmniCpp_MayCompleteDot = 1 " autocomplete with .
	                let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
					let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
					let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
					let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
					let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
					let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
					let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
					"let OmniCpp_DefaultNamespaces=["std"]
					let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
					let OmniCpp_ShowAccess=1

	"-- Taglist setting --
	let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
	let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
	let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
	let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
	let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
	"是否一直处理tags.1:处理;0:不处理
	let Tlist_Process_File_Always=1 "实时更新tags
	let Tlist_Inc_Winwidth=0

	"-- WinManager setting --
	    let g:winManagerWindowLayout='FileExplorer|TagList|MiniBufferExplorer' " 设置我们要管理的插件
		"let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
		nmap wm :WMToggle<cr> 
	
	" -- MiniBufferExplorer --
	let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
	let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
	let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
	"let g:miniBufExplMapCTabSwitchWindows = 1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
	let g:miniBufExplModSelTarget = 1     "不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer

	"--fold setting--
	set foldmethod=syntax " 用语法高亮来定义折叠
	set foldlevel=100 " 启动vim时不要自动折叠代码
	set foldcolumn=5 " 设置折叠栏宽度

	"-- QuickFix setting --
	" 按下F6，执行make clean
	map <F6> :make clean<CR><CR><CR>
	" 按下F7，执行make编译程序，并打开quickfix窗口，显示编译信息
	map <F7> :make<CR><CR><CR> :copen<CR><CR>
	" 按下F8，光标移到上一个错误所在的行
	map <F8> :cp<CR>
	" 按下F9，光标移到下一个错误所在的行
	map <F9> :cn<CR>
	" 以上的映射是使上面的快捷键在插入模式下也能用
	imap <F6> <ESC>:make clean<CR><CR><CR>
	imap <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
	imap <F8> <ESC>:cp<CR>
	imap <F9> <ESC>:cn<CR>

	"-- Cscope setting --
	if has("cscope")
		set csprg=/usr/bin/cscope        " 指定用来执行cscope的命令
		set csto=0                        " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
		set cst " 同时搜索cscope数据库和标签文件
		set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
		set nocsverb
		if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim
			cs add cscope.out
		elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
			cs add $CSCOPE_DB
		endif
		set csverb
	endif
	map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
	imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
	" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-,      然后很快再按下c）
	nmap <C-_>s :cs find s <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
	nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
	nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
	nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>

	nnoremap <silent> <F12> :A<CR>

	"--vboomark setting --
	let g:vbookmark_bookmarkSaveFile = $HOME . '/.vimbookmark'
	" 禁用默认的按键绑定
	"let g:vbookmark_disableMapping = 1
	" " 使用 Visual Studio 书签的按键方式
	"nnoremap <silent> <C-F2> :VbookmarkToggle<CR>
	"nnoremap <silent> <F2> :VbookmarkNext<CR>
	"nnoremap <silent> <S-F2> :VbookmarkPrevious<CR>
	
	nnoremap <silent> <F3> :Grep<CR>
	let mapleader=','

	""""""""""""""""""""""""""""""  
	" Vunble  
	" """"""""""""""""""""""""""""""  
"	filetype off " required!  
"	set rtp+=~/.vim/bundle/vundle/  
"	call vundle#rc()  
"
"	" let Vundle manage Vundle  
"	Bundle 'gmarik/vundle'  
"
"	" vim-scripts repos  
"	"Bundle 'Valloric/YouCompleteMe'  
"	"Bundle 'scrooloose/syntastic'

	filetype plugin indent on "
"
"	" 自动补全配置
	set completeopt=longest,menu " "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
	let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif
	" "离开插入模式后自动关闭预览窗口
	inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
	" "回车即选中当前项
	" "上下左右键的行为 会显示其他信息
	inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
	inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
	inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
	inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
	
	"youcompleteme  默认tab  s-tab 和自动补全冲突
	"let g:ycm_key_list_select_completion=['<c-n>']
	let g:ycm_key_list_select_completion = ['<Down>']
	"let g:ycm_key_list_previous_completion=['<c-p>']
	let g:ycm_key_list_previous_completion = ['<Up>']
	let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

	let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM
	" 基于标签引擎
	let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
	let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
	let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
	nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> 
	"nnoremap <leader>lo :lopen<CR>	"open locationlist
	"nnoremap <leader>lc :lclose<CR>	"close locationlist
	inoremap <leader><leader> <C-x><C-o>
	" "在注释输入中也能补全
	let g:ycm_complete_in_comments = 1
	" "在字符串输入中也能补全
	let g:ycm_complete_in_strings = 1
	" "注释和字符串中的文字也会被收入补全
	let g:ycm_collect_identifiers_from_comments_and_strings = 0

	nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 

	let Tlist_Auto_Highlight_Tag=1  
	let Tlist_Auto_Update=1  
	let Tlist_Display_Tag_Scope=1  
	let Tlist_Enable_Dold_Column=1 
	let Tlist_Use_SingleClick=1  
    let Tlist_WinWidth=25
	autocmd FileType python	set omnifunc=pythoncomplete#Complete   
	autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS   
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags   
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS   
	autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags   
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP   
	autocmd FileType c set omnifunc=ccomplete#Complete       
	let g:pydiction_location='~/.vim/tools/pydiction/complete-dict'  
	let g:pydiction_menu_height=20
	set autoindent 
	set tabstop=4  
	set shiftwidth=4  
	set expandtab   
	set number
	set softtabstop=4
	set foldmethod=indent
