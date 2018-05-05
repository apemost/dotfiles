Plug 'scrooloose/nerdtree'

let NERDTreeIgnore = ['\.git$', '\.pyc$', '__pycache__', 'node_modules']
let NERDTreeMapJumpNextSibling = '<C-n>'
let NERDTreeMapJumpPrevSibling = '<C-p>'

autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
