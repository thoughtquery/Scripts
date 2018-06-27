#! /bin/sh

################################################################################
#
# install puppet on raspberry pi
# this is basically a copy of a blog post from runar balstad jensen
# http://stdout.no/puppet-on-raspberry-pi/
#
################################################################################

TMPDIR=/tmp/build

# add key
apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 4BD6EC30

# add sources
cat > /etc/apt/sources.list.d/puppetlabs.list << EOF
deb-src http://apt.puppetlabs.com wheezy main
deb-src http://apt.puppetlabs.com wheezy dependencies
EOF

# update
apt-get update

# create a temp dir
[ -e "${TMPDIR}" ] || mkdir "${TMPDIR}"
cd "${TMPDIR}"

# get package sources, build packages
for pkg in facter hiera ruby-rgen; do
  apt-get -y build-dep $pkg
  apt-get -b source $pkg
done

# install dependencies
apt-get install virt-what ruby-json
dpkg -i facter_*.deb hiera_*.deb ruby-rgen_*.deb

# build puppet itself
apt-get -y build-dep puppet
apt-get -b source puppet

# install packages
apt-get install -y augeas-lenses libaugeas0 libaugeas-ruby1.8 ruby-shadow libshadow-ruby1.8
dpkg -i puppet-common_*.deb puppet_*.deb

# rm temp dir
echo "remove temp dir (${TMPDIR})? [ctrl+c to abort]"
read ok
cd
rm -rf "${TMPDIR}"
