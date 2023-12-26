# magma.nvim dependencies install script
#
# magma.nvim plugim handles cell-like code execution within nvim
# by using kernels installe within jupyter.
#
# Source: https://github.com/dccsillag/magma-nvim
#
# NOTE: Following configuration is focuesed on python and Julia.
# This imples that dotnet dependencies are not installed
# 
# NOTE: Ueberzug is not accessable with pip, but can be installed
# with Linux package managers. In case of the script pacman is used
# so if you use different distro edit needed lines.
#
# Author: github/Bartosz1280

# Python dependencies
pip install pynvim
pip install jupyter_client
pip install Pillow
pip install cairosvg
pip install pnglatex
pip install plotly
pip install kaleido
pip install pyperclip
# Dependecies installed with Linux package manager
sudo pacman -S ueberzug
# .NET v
