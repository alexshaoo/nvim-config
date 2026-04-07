My nvim configs, mostly taken from [this](https://www.josean.com/posts/how-to-setup-neovim-2024)

Neovim keybinds

NOTE: every command starts with <leader> which is space in my case
ALSO NOTE: all of these are also stored and shown after 500 ms of clicking <leader>, in case i forget
<CR> = Enter key
<BS> = Backspace

============
window/tab stuff
============
sv/sh split window vertically/horizontally
se make splits equal size
sx close window
sm toggle maximize window

to/tx open/close new tab
tn/tp go to next/previous tab
tf open current buffer in new 

======
terminal
======
:

====
tmux
====
<C-h/j/k/l> to focus tmux left/down/up/right

======
explorer
======
ee toggle file explorer
ef toggle file explorer for current file
ec/er collapse/refresh file explorer
eo focus file explorer

========
completion
========
<Tab>/<S-Tab> next/previous item
<C-Space>/<C-e> trigger/abort completion
Say you pressed <Esc> accidentally but want the autocompletion back, then use <C-Space> to reopen it
If there are too many suggestions blocking your view, <C-e> closes that popup

================
telescope finder stuff
================
close with ctrl c

ctrl j/k to move down/up
ff find file
fs find string
fr for find recently opened files
fc to find instances of the current word the cursor is hovering over

==========
session stuff
==========
ws to save session
wr to restore session

will also save periodically
example of use case: if you have multiple window splits and you do :qa to close all, wr can restore all the windows back

==========
autocomplete
==========
ctrl j/k to move down/up suggestions
ctrl e/space to close/reopen suggestions

========
formatting
========
cf to format
only have linting/formatting for c/c++ setup so far

====
latex
====
ll Compile + continuous preview latex
lv View/refresh PDF in skim
lk Stop compilation
lc Clean auxiliary files 


NOTE: these do not need <leader> before 
=======
treesitter
=======
:InspectTree gives the AST
<CR> + <CR> + <CR> + … init selection/expand to next node
<CR> + <Tab> + <Tab> + … expand out in scope
<BS> shrink selection one node

====
errors
====
gl show current error on cursor line
[d/]d previous/next error

=======
templates
=======
in any cpp file, type cpp then press tab
