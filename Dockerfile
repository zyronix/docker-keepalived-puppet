FROM debian:jessie
MAINTAINER Zyronix "github.com@ocbios.nl"

RUN apt-get -q update
RUN apt-get -y -q install wget git-core rubygems
RUN gem install --no-ri --no-rdoc puppet librarian-puppet

RUN mkdir /puppet
ADD build.pp /puppet
ADD run.pp /puppet
ADD Puppetfile /puppet

WORKDIR /puppet
RUN librarian-puppet install
RUN puppet apply --modulepath=/puppet/modules build.pp

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
