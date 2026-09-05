# syntax=docker/dockerfile:1

FROM ubuntu:26.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install the standard package groups without prompts or host maintenance.
RUN --mount=type=bind,source=scripts/apt.sh,target=/tmp/apt.sh \
    bash /tmp/apt.sh --non-interactive --install-only --no-install-recommends \
      -- ca-certificates locales \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8

RUN adduser --disabled-password --gecos '' apemost

USER apemost
WORKDIR /home/apemost

# Cache shell dependencies independently of changes to the dotfiles.
RUN curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o /tmp/install-oh-my-zsh.sh \
    && sh /tmp/install-oh-my-zsh.sh --unattended \
    && rm /tmp/install-oh-my-zsh.sh \
    && git clone --depth=1 https://github.com/zplug/zplug.git /home/apemost/.zplug \
    && git clone --depth=1 https://github.com/zplug/zplug.git /home/apemost/.zplug/repos/zplug/zplug \
    && git clone --depth=1 https://github.com/denysdovhan/spaceship-prompt.git /home/apemost/.zplug/repos/denysdovhan/spaceship-prompt \
    && git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git /home/apemost/.zplug/repos/zsh-users/zsh-autosuggestions \
    && git clone --depth=1 https://github.com/tmux-plugins/tpm /home/apemost/.tmux/plugins/tpm

COPY --chown=apemost:apemost . /home/apemost/projects/apemost/dotfiles
WORKDIR /home/apemost/projects/apemost/dotfiles

RUN source bootstrap.sh

WORKDIR /home/apemost

CMD ["/usr/bin/zsh", "-l"]
