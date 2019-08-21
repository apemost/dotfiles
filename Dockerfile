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
RUN git clone https://github.com/zplug/zplug.git /root/.zplug

ADD . /dotfiles

WORKDIR /dotfiles

RUN ["/usr/bin/bash", "-c", "source bootstrap.sh --with-vimrc && yes | vim +PlugInstall +qa"]
RUN ["/usr/bin/zsh", "-ci", "zplug install || true"]

CMD ["/usr/bin/zsh", "-l"]
