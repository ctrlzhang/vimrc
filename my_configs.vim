"" common configure
set nu
set autowriteall
set completeopt-=preview

"" cscope configure
nmap <leader>sa :cs add cscope.out<cr>
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cword>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>

if has("cscope") && filereadable("/usr/local/bin/cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB!=""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

"" emmet-vim configure
let g:user_emmet_mode = 'a'

"" tlist configure 
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
"let Tlist_WinWidth=28
nmap <leader>tt :TlistToggle<cr>

"" NERDTree configure
"let NERDTreeWinSize=28

"" syntastic configure
"let g:syntastic_ignore_files = [".*\.py$"]
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_check_on_open = 1
"let g:syntastic_cpp_include_dirs = ['/usr/include']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_enable_balloons = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '?'
"let g:syntastic_auto_jump = 1

"" YouCompleteMe configure
let g:ycm_global_ycm_extra_conf = '~/.vim_runtime/sources_non_forked/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nmap <F12> :YcmCompleter GoToDefinitionElseDeclaration<cr>
nmap <F4> :YcmDiags<cr>

"" jsbeautify configure
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap<buffer><c-f> :call JsBeautify<cr>
autocmd FileType html noremap<buffer><c-f> :call HtmlBeautify<cr>
autocmd FileType css noremap<buffer><c-f> :call CSSBeautify<cr>

"" vim-indent-guides configure
let g:indent_guides_guide_size = 1

"" vim-go setting
let g:godef_split=0
"let g:go_auto_type_info=1
au FileType go nmap <leader>jd <Plug>(go-def)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>gd <Plug>(go-doc)

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return file
endfunction

let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'
let g:LookupFile_TagExpr="/data/developer/work/filenametags"
nmap <leader>lt :LUTags<cr>
nmap <leader>lb :LUBufs<cr>
nmap <leader>lw :LUWalk<cr>

"colorschema
"colorscheme twilight 
"colorscheme solarized
"colorscheme Tomorrow-Night-Bright 
"colorscheme Tomorrow-Night-Eighties 
"colorscheme Tomorrow-Night-Blue 
colorscheme Tomorrow-Night 

if has('gui_running')
    set background=light
else
    set background=dark
endif

"doxygen tool config
let g:DoxygenToolkit_briefTag_pre="@Brief "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns "
"let g:DoxygenToolkit_blockHeader="-------------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="-------------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="ctrlzhang"

let s:licenseTag = "Copyright(C) 2015, ctrlzhang \<enter>"
let s:licenseTag = s:licenseTag . "All right reserved \<enter>"
let s:licenseTag = s:licenseTag . "Redistribution and use in source and binary forms, with or without \<enter>"
let s:licenseTag = s:licenseTag . "modification, are permitted provided that the following conditions are met: \<enter>"
let s:licenseTag = s:licenseTag . "    * Redistributions of source code must retain the above copyright\<enter>"
let s:licenseTag = s:licenseTag . "      notice, this list of conditions and the following disclaimer.\<enter>"
let s:licenseTag = s:licenseTag . "    * Redistributions in binary form must reproduce the above copyright\<enter>"
let s:licenseTag = s:licenseTag . "      notice, this list of conditions and the following disclaimer in the\<enter>"
let s:licenseTag = s:licenseTag . "      documentation and/or other materials provided with the distribution.\<enter>"
let s:licenseTag = s:licenseTag . "    * Neither the name of the <organization> nor the\<enter>"
let s:licenseTag = s:licenseTag . "      names of its contributors may be used to endorse or promote products\<enter>"
let s:licenseTag = s:licenseTag . "      derived from this software without specific prior written permission."

let g:DoxygenToolkit_licenseTag=s:licenseTag
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_briefTag_funcName="yes"
nmap <leader>xl :DoxLic<cr>
nmap <leader>xa :DoxAuthor<cr>
nmap <leader>xf :Dox<cr>

"file encoding
set fileencoding=utf-8
fileencoding=ucs-bom, utf-8, cp936

"python code complete have implemented by python-mode
