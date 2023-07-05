import subprocess

subprocess.run(['mv', '.vimrc', '~/.'])
subprocess.run(['git', 'clone', 'https://github.com/VundleVim/Vundle.vim.git', '~/.vim/bundle/Vundle.vim'])
subprocess.run(['vim', '+PluginInstall', '+qa!'])
subprocess.run(['source', '.bashrc'])
