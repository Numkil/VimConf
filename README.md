VimConf
=======
This vimconf was made for my personal use and is a collage of small parts from various
other public vimrc's added to with my own preferences.
I am perfectly happy with anyone copying and using any part of the code written
here, as I also copied it from other sources. I might change any part of this
code at any time..

* Complete automated installation. As in 2 commands only.
* I strived to comment every single option as much as possible and keep the
  code clean.
* Autocomplete, syntax checker, plugin manager, git wrapper, file browser and much more

Installation
------------
**Required packages:**

* Git
* Hack Nerd Font
* [Neovim](https://github.com/neovim/neovim) together with both python2 and python3 plugin installed
* [rg](https://github.com/BurntSushi/ripgrep)

**advice:** I strongly advice using a terminal emulator that supports 256 colors if you
want to benefit from the amazing solarized colorscheme, Terminator
is in my opinion the easiest to set up.

**Instructions:**

    git clone https://github.com/Numkil/VimConf.git
    ln -s /PathToWhereYouCloned/VimConf/.init.vim ~/.config/nvim/init.vim

Running vim after these instructions will start an automated setup process to
install all plugins and then quit out vim.
