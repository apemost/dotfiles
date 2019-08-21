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
      ripgrep \
      zsh

RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb && \
      dpkg -i ripgrep_11.0.2_amd64.deb

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"

ADD . /dotfiles

WORKDIR /dotfiles

RUN source bootstrap.sh --with-vimrc
RUN yes | vim +PlugUpdate +qa

CMD ['/usr/bin/zsh', '-l']
