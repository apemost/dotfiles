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
RUN git clone https://github.com/zplug/zplug.git /root/.zplug

ADD . /dotfiles

WORKDIR /dotfiles

RUN bash -c 'source bootstrap.sh --with-vimrc'
RUN bash -c 'yes | vim +PlugInstall +qa'
RUN ["/usr/bin/zsh", "-l"]

CMD ["/usr/bin/zsh", "-l"]
