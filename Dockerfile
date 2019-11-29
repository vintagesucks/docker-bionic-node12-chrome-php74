FROM ubuntu:bionic

RUN apt-get update && \
  apt -y upgrade

# install essential packages
RUN apt-get -y install \
  curl \
  build-essential \
  software-properties-common \
  language-pack-en-base \
  gconf-service \
  libasound2 \
  libgtk-3-0 \
  gconf-service \
  libasound2 \
  libgconf-2-4 \
  libnspr4 \
  libx11-dev \
  fonts-liberation \
  xdg-utils \
  libnss3 \
  libxss1 \
  libappindicator1 \
  libindicator7 \
  git \
  zip \
  unzip \
  xvfb \
  wget

# add Node.js v12.x, Yarn and PHP repos
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php && \
  apt-get update

# install Node.js v12.x, Yarn and PHP 7.4
RUN apt-get -y install \
  nodejs \
  yarn \
  php-xdebug \
  php7.4-fpm \
  php7.4-mbstring \
  php7.4-dom \
  php7.4-curl \
  php7.4-simplexml \
  php7.4-gd \
  php7.4-zip \
  php7.4-sqlite3 \
  php7.4-bcmath \
  php7.4-intl \
  php7.4-mysql

# install Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
  --install-dir=/usr/local/bin --filename=composer

# install Google Chrome
RUN wget \
  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  dpkg -i google-chrome*.deb && \
  apt-get install -f && \
  rm google-chrome-stable_current_amd64.deb
