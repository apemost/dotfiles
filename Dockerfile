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

RUN curl -sLO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
RUN dpkg -i ripgrep_13.0.0_amd64.deb && rm ripgrep_13.0.0_amd64.deb

RUN adduser --disabled-password --gecos '' apemost
RUN mkdir -p /home/apemost/projects/apemost

COPY . /home/apemost/projects/apemost/dotfiles

RUN chown -R apemost:apemost /home/apemost

USER apemost

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
RUN git clone https://github.com/zplug/zplug.git /home/apemost/.zplug
RUN git clone https://github.com/zplug/zplug.git /home/apemost/.zplug/repos/zplug/zplug
RUN git clone https://github.com/denysdovhan/spaceship-prompt.git /home/apemost/.zplug/repos/denysdovhan/spaceship-prompt
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/apemost/.zplug/repos/zsh-users/zsh-autosuggestions
RUN git clone https://github.com/tmux-plugins/tpm /home/apemost/.tmux/plugins/tpm

WORKDIR /home/apemost/projects/apemost/dotfiles

RUN ["/bin/bash", "-c", "source bootstrap.sh"]

WORKDIR /home/apemost

CMD ["/usr/bin/zsh", "-l"]
