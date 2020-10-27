"general{{{

call plug#begin('~/.config/nvim/plugged')
    Plug 'tomasiser/vim-code-dark'
    Plug 'junegunn/goyo.vim'
call plug#end()

"Compile
map <leader>c :w \| !compile %<CR><CR>
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
nnoremap <Space> za
set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set incsearch

"For find
set path+=**

"Bracets and quotes
vnoremap { "0c{<c-r>0}<esc>
vnoremap [ "0c[<c-r>0]<esc>
vnoremap ( "0c(<c-r>0)<esc>
vnoremap ½ "0c"<c-r>0"<esc>
vnoremap ' "0c'<c-r>0'<esc>



"set termguicolors
set ignorecase
colorscheme codedark
filetype plugin on
syntax on
set relativenumber
set number

nnoremap <F1> :echo<CR>
inoremap <F1> <C-o>:echo<CR>
inoremap <F10> <C-o>:vsp $MYVIMRC<CR>
nnoremap <F10> :vsp $MYVIMRC<CR>
set foldmethod=marker

"Calcurse MARKDOWN
autocmd Bufread,Bufnewfile /tmp/calcurse* set filetype=markdown

autocmd Bufwritepost *xresources !xrdb %
autocmd Bufwritepost *config.h !sudo make install


"Netrw{{{


let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <C-E> :call ToggleNetrw()<CR>


let g:netrw_banner=0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
set wildmenu
set path+=**

nnoremap <leader>x :call ToggleNetrw()<CR>
nnoremap <leader>f :find 
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>

nnoremap <leader>t  :ter<CR>
nnoremap <leader>vt :vsp \| ter<CR>

"}}}


"}}}

"MARKDOWN{{{

autocmd FileType markdown setlocal comments=nb:+,nb:*
autocmd FileType markdown setlocal formatoptions=ctnqro

"}}}

"LATEX{{{

let  g:tex_flavor = "latex"
autocmd FileType tex set wrap linebreak nolist


"compileing and spellcheck
autocmd FileType tex map <F2> :!zathura %:r.pdf &<CR><CR>
autocmd FileType tex map <leader>b :!biber %:r<CR>
set spelllang=en_us,da
map <F5> :setlocal spell!<CR>
" map <F6> :setlocal spell! spelllang=da<CR>

autocmd FileType tex nnoremap j gj
autocmd FileType tex nnoremap k gk


"Generel units{{{
autocmd Filetype tex inoremap ;tw \textwidth
autocmd Filetype tex inoremap ;pw \paperwidth
autocmd FileType tex inoremap ;vs \vspace{}\\<++><Esc>?}<Enter>i
autocmd FileType tex inoremap ;<Enter> \\<Enter>
autocmd FileType tex inoremap ;np \newpage


"packages and commands
autocmd FileType tex inoremap ;p \usepackage{}%<++><Esc>F}i
autocmd FileType tex inoremap ;pp \usepackage[]{<++>}%<++><Esc>F]i
autocmd FileType tex inoremap ;nc \newcommand{}[<++>]{<Enter><++><Enter>}<Esc>?{}<CR>a


"}}}

"Bib{{{
autocmd Filetype tex map <F3> :vsp ~/Dropbox/AU/Bib/bib.bib<Enter>

"refrenceing
autocmd FileType tex inoremap ;fn \footnote{}<++><Esc>F}i
autocmd FileType tex inoremap ;tc \textcite{}<++><Esc>F}i
autocmd FileType tex inoremap ;ci \cite{}<++><Esc>F}i
autocmd FileType tex inoremap ;fc \footfullcite{}<++><Esc>F}i
autocmd FileType tex inoremap ;re \ref{}<++><Esc>F}i

"litteraturliste{{{
autocmd FileType bib inoremap ;i @misc{,<Enter>author="<++>",<Enter>title="<++>",<Enter>year="<++>",<Enter>url="<++>"<Enter>}<Enter><Enter><++><Esc>?{<Enter>a
autocmd FileType bib inoremap ;b @book{,<Enter>author="<++>",<Enter>title="<++>",<Enter>year="<++>",<Enter>publisher="<++>",<Enter>edition="<++>"<Enter>}<Enter><Enter><++><Esc>?{<Enter>a

"}}}

"}}}

"Enviorments{{{

autocmd FileType tex inoremap ;nu \begin{enumerate}<Enter>\end{enumerate}<Enter><Enter><++><Esc>?enum<Enter>O\item
autocmd FileType tex inoremap ;it \begin{itemize}<Enter>\end{itemize}<Enter><Enter><++><Esc>?item<Enter>O\item
autocmd FileType tex inoremap ;ta \begin{tabular}{}<Enter><++><Enter>\end{tabular}<Enter><++><Esc>?{}<CR>a
autocmd FileType tex inoremap ;tab \begin{table}[h]<CR>\centering<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{table}<CR><++><Esc>?caption<CR>O

autocmd FileType tex inoremap ;ce \begin{center}<Enter>\end{center}<Enter><++><Esc>?cen<CR>O
autocmd FileType tex inoremap ;fi \begin{figure}[]<Enter>\centering<Enter>\includegraphics[width=<++>\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Enter><Enter><++><Esc>?re}[<Enter>f[ci[
autocmd FileType tex inoremap ;mp \begin{minipage}[]<Enter><++><Enter>\end{minipage}<Enter><Enter><++><Esc>?[]<CR>a

autocmd FileType tex inoremap ;i \textit{}<Space><++><Esc>F}i
autocmd FileType tex inoremap ;b \textbf{}<Space><++><Esc>F}i
autocmd FileType tex inoremap ;l \\<Enter>
autocmd FileType tex inoremap ;pa <Enter>\bigskip<Enter><Enter>
autocmd FileType tex inoremap ;s \section{}<Enter><Enter><++><Esc>?}<Enter>i
autocmd FileType tex inoremap ;ss \subsection{}<Enter><Enter><++><Esc>?}<Enter>i

autocmd FileType tex inoremap ;al \begin{align*}<Enter>\end{align*}<Enter><++><Esc>?gn*<Enter>O
autocmd FileType tex inoremap ;aln \begin{align}<Enter>\end{align}<Enter><++><Esc>?align<Enter>O
autocmd FileType tex inoremap ;sp \begin{split}<Enter>\end{split}<Enter><++><Esc>?it}<Enter>O

"Equations{{{

autocmd FileType tex inoremap ;e $$<++><Esc>F$i
autocmd FileType tex inoremap ;eq \begin{equation*}<Enter>\end{equation*}<Enter><Enter><++><Esc>?tion<Enter>O
autocmd FileType tex inoremap ;eqn \begin{equation}\label{eq:}<Enter><++><Enter>\end{equation}<Enter><++><Esc>?:<Enter>a
autocmd FileType tex inoremap ;ga \begin{gathered}<Enter>\end{gathered}<Esc>?red<Enter>O
autocmd FileType tex inoremap ;f \frac{}{<++>}<++><Esc>F}F}i
autocmd FileType tex inoremap ;df \dfrac{}{<++>}<++><Esc>F}F}i
autocmd FileType tex inoremap ;c \cdot
autocmd Filetype tex inoremap ;d _{}<++><Esc>F}i
autocmd Filetype tex inoremap ;u ^{}<++><Esc>F}i


autocmd FileType tex inoremap ;br \bra{}<++><Esc>F}i
autocmd FileType tex inoremap ;ke \ket{}<++><Esc>F}i
autocmd FileType tex inoremap ;bk \braket{}<++><Esc>F}i

autocmd Filetype tex inoremap ;pma \begin{pmatrix}<Enter>\end{pmatrix}<Enter><++><Esc>?rix<Enter>O
autocmd Filetype tex inoremap ;bma \begin{bmatrix}<Enter>\end{pmatrix}<Enter><++><Esc>?rix<Enter>O

autocmd Filetype tex inoremap ;le \left
autocmd Filetype tex inoremap ;ri \right

"}}}

"}}}


"MATH{{{

"greek_letters{{{
autocmd Filetype tex inoremap <leader><leader>a \alpha
autocmd Filetype tex inoremap <leader><leader>n \nu
autocmd Filetype tex inoremap <leader><leader>b \beta
autocmd Filetype tex inoremap <leader><leader>x \xi
autocmd Filetype tex inoremap <leader><leader>X \Xi
autocmd Filetype tex inoremap <leader><leader>g \gamma
autocmd Filetype tex inoremap <leader><leader>G \Gamma
autocmd Filetype tex inoremap <leader><leader>d \delta
autocmd Filetype tex inoremap <leader><leader>D \Delta
autocmd Filetype tex inoremap <leader><leader>e \epsilon
autocmd Filetype tex inoremap <leader><leader>ve \varepsilon
autocmd Filetype tex inoremap <leader><leader>r \rho
autocmd Filetype tex inoremap <leader><leader>vr \varrho
autocmd Filetype tex inoremap <leader><leader>z \zeta
autocmd Filetype tex inoremap <leader><leader>s \sigma
autocmd Filetype tex inoremap <leader><leader>S \Sigma
autocmd Filetype tex inoremap <leader><leader>et \eta
autocmd Filetype tex inoremap <leader><leader>t \tau
autocmd Filetype tex inoremap <leader><leader>vth \vartheta
autocmd Filetype tex inoremap <leader><leader>Th \Theta
autocmd Filetype tex inoremap <leader><leader>th \theta
autocmd Filetype tex inoremap <leader><leader>u \upsilon
autocmd Filetype tex inoremap <leader><leader>U \Upsilon
autocmd Filetype tex inoremap <leader><leader>i \iota
autocmd Filetype tex inoremap <leader><leader>f \phi
autocmd Filetype tex inoremap <leader><leader>F \Phi
autocmd Filetype tex inoremap <leader><leader>vp \varphi
autocmd Filetype tex inoremap <leader><leader>P \Phi
autocmd Filetype tex inoremap <leader><leader>k \kappa
autocmd Filetype tex inoremap <leader><leader>kh \chi
autocmd Filetype tex inoremap <leader><leader>l \lambda
autocmd Filetype tex inoremap <leader><leader>L \Lambda
" autocmd Filetype tex inoremap <leader><leader>p \pi
" autocmd Filetype tex inoremap <leader><leader>P \Pi
autocmd Filetype tex inoremap <leader><leader>P \psi
autocmd Filetype tex inoremap <leader><leader>p \Psi
autocmd Filetype tex inoremap <leader><leader>m \mu
autocmd Filetype tex inoremap <leader><leader>o \omega
autocmd Filetype tex inoremap <leader><leader>O \Omega
"}}}

"Python{{{

autocmd FileType python inoremap ;p print()<++><Esc>F)i

autocmd FileType python inoremap ;im import<space>

autocmd FileType python nnoremap <F5> :w<Enter>:!python3 %<Enter>

autocmd FileType python inoremap <F5> <esc>:w<Enter>:!python3 %<Enter>

autocmd FileType python inoremap ;f for in <++>:<Enter><++> <Esc>kFra<Space>

autocmd FileType python inoremap ;de def: <Enter><Tab><++><Esc>?def<Enter>f:i<Space>

"}}}

"}}}

"}}}

"OCTAVE{{{
autocmd BufRead,BufNewFile *.m,*.oct set filetype=octave
autocmd FileType octave nnoremap <F5> :w \| term octave % <CR>
autocmd TermOpen * startinsert
autocmd FileType octave inoremap <F5> <Esc>:w \| !octave %<CR>

"}}}

set completeopt-=preview
imap ,/ </<C-X><C-O>
imap <silent> <C-c> </<C-X><C-O><C-X><Esc>F<i