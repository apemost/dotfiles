FROM ubuntu:19.10

RUN apt update && apt install -y binutils \
      curl \
      git \
      vim \
      build-essential \
      make \
      cmake \
      ctags \
      silversearcher-ag \
      autojump \
      htop \
      jq \
      latexmk \
      markdown \
      rsync \
      ripgrep \
      zsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"

ADD . /dotfiles

WORKDIR /dotfiles

RUN source bootstrap.sh --with-vimrc
RUN yes | vim +PlugUpdate +qa

CMD ['/usr/bin/zsh', '-l']
