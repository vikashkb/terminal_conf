import subprocess

subprocess.run(['cp', '.vimrc', '~/'])
subprocess.run(['git', 'clone', 'https://github.com/VundleVim/Vundle.vim.git', '~/.vim/bundle/Vundle.vim'])
subprocess.run(['vim', '+PluginInstall', '+qa!'])

subprocess.run(['cp', '.bashrc', '~/'])
subprocess.run(['source', '~/.bashrc'])

subprocess.run(['cp', '.tmux.conf', '~/'])
subprocess.run(['tmux', 'source-file', '.tmux.conf'])
