VimConf
=======
This vimconf was made for my personal use and has been compiled from various other public vimrc's, I
am Uploading this here for safekeeping.
It's less configurable than most public vimrc's made for the public because I don't work with
external files to prevent mishaps when updating.
If you are looking to use someones vimconf and maybe do a little changes I suggest going for the
more well known ones like timss/vimconf, those are more suited to add your own things and
probably more updated.
But ofcourse if you happen to stumble on here or you are one of my colleagues you can use and edit this code as much as you want.

* Installs itself
* I've tried to comment every single option
* Autocomplete, syntax checker, plugin manager, file browser and much more

Installation
------------
**Required packages:** clang, ctags, jedi, ruby, a terminal emulator that supports 256 colors if you
want to benefit from the amazingly researched solarized colorscheme, personally I prefer using Gvim
because it makes copying from different sources and colourschemes a hell of a lot more straightforward.

    git clone https://github.com/Numkil/VimConf.git
    ln -s /pathTowhereyoucloned/VimConf/.vimrc ~/.vimrc

Running vim with this .vimrc will cause it to automatically install Vundle and a bunch of plugins. (I
hope)

Preview
-------
![Preview](http://imgur.com/6S796Zt.png "screeny")

Credits
-------
I should give credits to most of the public .vimrc's out there because well this really is mostly a
compilation of various public .vimrc's with some additions of myself.
