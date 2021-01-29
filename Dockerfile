FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      binutils \
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

RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
RUN dpkg -i ripgrep_12.1.1_amd64.deb

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
