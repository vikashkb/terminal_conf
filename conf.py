import subprocess

subprocess.run(['cp', '.vimrc', '~/'])
subprocess.run(['git', 'clone', 'https://github.com/VundleVim/Vundle.vim.git', '~/.vim/bundle/Vundle.vim'])
subprocess.run(['vim', '+PluginInstall', '+qa!'])
