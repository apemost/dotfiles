FROM ubuntu:19.10

RUN apt update && apt install -y binutils \
      bat \
      curl \
      git \
      vim \
      build-essential \
      make \
      cmake \
      ctags \
      silversearcher-ag \
      autojump \
      gawk \
      htop \
      jq \
      latexmk \
      markdown \
      rsync \
      ripgrep \
      locales \
      zsh && locale-gen 'en_US.UTF-8'

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
RUN git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm

ENV RUNNING_IN_DOCKER=1

ADD . /dotfiles

WORKDIR /dotfiles

RUN ["/usr/bin/bash", "-c", "source bootstrap.sh --with-vimrc && yes | vim +PlugInstall +qa"]

CMD ["/usr/bin/zsh", "-l"]
