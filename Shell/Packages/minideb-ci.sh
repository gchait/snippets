install_packages \
  openssh-client netcat-openbsd \
  curl wget gettext docker.io dnsutils jq \
  moreutils zip unzip gpg npm pipx git

CI=1 npx playwright install-deps \
  && pipx install docker-squash \
  && pipx install rust-just
