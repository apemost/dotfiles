FROM ubuntu:21.04

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
      locales \
      zsh && locale-gen 'en_US.UTF-8'

RUN apt install -y ripgrep


RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
RUN git clone https://github.com/zplug/zplug.git /root/.zplug
RUN git clone https://github.com/zplug/zplug.git /root/.zplug/repos/zplug/zplug
RUN git clone https://github.com/denysdovhan/spaceship-prompt.git /root/.zplug/repos/denysdovhan/spaceship-prompt
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git /root/.zplug/repos/zsh-users/zsh-autosuggestions
RUN git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm

ENV RUNNING_IN_DOCKER=1

ADD . /dotfiles

WORKDIR /dotfiles

RUN ["/usr/bin/bash", "-c", "source bootstrap.sh --with-vimrc && yes | vim +PlugInstall +qa"]

CMD ["/usr/bin/zsh", "-l"]
