FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      autojump \
      bat \
      binutils \
      build-essential \
      cmake \
      ctags \
      curl \
      gawk \
      git \
      htop \
      jq \
      latexmk \
      locales \
      make \
      markdown \
      python3-venv \
      rsync \
      silversearcher-ag \
      vim \
      zsh && locale-gen 'en_US.UTF-8'

RUN curl -sLO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
RUN dpkg -i ripgrep_12.1.1_amd64.deb && rm ripgrep_12.1.1_amd64.deb

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
RUN git clone https://github.com/zplug/zplug.git /root/.zplug
RUN git clone https://github.com/zplug/zplug.git /root/.zplug/repos/zplug/zplug
RUN git clone https://github.com/denysdovhan/spaceship-prompt.git /root/.zplug/repos/denysdovhan/spaceship-prompt
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git /root/.zplug/repos/zsh-users/zsh-autosuggestions
RUN git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm

ENV RUNNING_IN_DOCKER=1

ADD . /dotfiles

WORKDIR /dotfiles

RUN ["/usr/bin/bash", "-c", "source bootstrap.sh"]

CMD ["/usr/bin/zsh", "-l"]
