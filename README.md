# dotfiles

This is my dotfiles repo. There are many like it, but this one is mine. 

## Usage

I use [rcm](https://github.com/thoughtbot/rcm) by thoughtbot, so grab that first.

```BASH
git clone git@github.com:tombeynon/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule init
git submodule update
rcup [-t osx]
```

## First time setup

Install [Homebrew](http://brew.sh/).

Do everything in [Usage](#usage).

Set your terminal emulator font to a [NERD Font](https://github.com/ryanoasis/nerd-fonts). I like [Source Code Pro](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf).

```BASH
brew bundle
chsh -s $(which zsh)
pip3 install --user neovim
```

## Additional bits

```BASH
gem install neovim
pip3 install --upgrade git+git://github.com/tbabej/tasklib@develop
```
