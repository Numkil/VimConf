VimConf
=======
This vimconf was made for my personal use and has been compiled from various other public vimrc's, I
am Uploading this here for safekeeping.
If you are looking to use someones vimconf and maybe do a little changes I suggest going for the
more well known ones like timss/vimconf, those are more suited to add your own things and
probably more updated.
But ofcourse if you happen to stumble on here or you are one of my colleagues you can use and edit this code as much as you want.

* Installs itself
* I've tried to comment every single option
* Autocomplete, syntax checker, plugin manager, file browser and much more

Installation
------------
**Required packages:** 

    clang, ctags, git, gcc, gcc-c++

**advice:** I strongly advice to use a terminal emulator that supports 256 colors if you
want to benefit from the amazingly researched solarized colorscheme, personally I prefer using Gvim
because it makes copying from different sources and using colourschemes a hell of a lot more straightforward.

**Instructions:**

    git clone https://github.com/Numkil/VimConf.git
    ln -s /pathTowhereyoucloned/VimConf/.vimrc ~/.vimrc

Running vim with this .vimrc will cause it to automatically install Vundle and a bunch of plugins. (I
hope)

**Making your own configurations:** This is possible through manually creating a file called
.vimrc_personal in your home folder. You can there add stuff that won't be overwritten when pulling in
the latest version of this config. Beware though that this will override settings if you are not
carefull. 

Preview
-------
![Preview](http://i.imgur.com/DQ1IRvj.png "light")
![Preview](http://i.imgur.com/5LEeZ1w.png "dark")

TODO
----
* Changing background colour with f7 kills overlength.
* Strange error message from neosnippet keeps popping up
* Keep up to date with new stuff I find.

Credits
-------
I should give credits to most of the public .vimrc's out there because well this really is mostly a
compilation of various public .vimrc's with some additions of myself.

