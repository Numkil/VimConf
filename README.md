VimConf
=======
This vimconf was made for my personal use and is a collage of small parts from various 
other public vimrc's added to with my own preferences.
I am perfectly happy with anyone copying and using any part of the code written
here, as I also copied it from other sources.
Using this .vimrc without reading it or making any changes however is not a
good idea. There are other .vimrc's more suited for this (Timss/vimconf is a
good example) and even then it is better to also make your own decisions.

* Complete automated installation. As in 2 commands only.
* I strived to comment every single option as much as possible and keep the
  code clean. 
* Autocomplete, syntax checker, plugin manager, git wrapper, file browser and much more

Installation
------------
**Required packages:** 

    clang, ctags, git, vim compiled with python, and lua support

**advice:** I strongly advice using a terminal emulator that supports 256 colors if you
want to benefit from the amazing solarized colorscheme, Terminator
is in my opinion the easiest to set up. Gvim also works straight out of the box
and supports copying from the clipboard. My advice is to have both ready so you
can use whatever suits the current use case best.

**Instructions:**

    git clone https://github.com/Numkil/VimConf.git
    ln -s /PathToWhereYouCloned/VimConf/.vimrc ~/.vimrc

Running vim with this .vimrc will cause it to automatically install Vundle and a bunch of plugins. (I
hope)

**Making your own configurations:** This is possible through manually creating a file called
.vimrc_personal in your home folder. You can there add stuff that won't be overwritten when pulling in
the latest version of this .vimrc. Since this will be called last it can and
will override options defined earlier on. Handle it with thought. 

Preview
-------
![Preview](http://i.imgur.com/DQ1IRvj.png "light")
![Preview](http://i.imgur.com/5LEeZ1w.png "dark")

TODO
----
* Changing background colour with f7 kills overlength.
* Keep up to date with new stuff I find.

Credits
-------
I should give credits to most of the public .vimrc's out there because well this really is mostly a
compilation of various public .vimrc's with some additions of myself.

