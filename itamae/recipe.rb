# git
package 'git' do
  action :install
end

# nginx
package 'nginx' do
  action :install
end

# ruby
%w(ruby ruby-dev).each do |p|
  package p do
    action :install
  end
end

execute 'install bundler' do
  command 'sudo gem install bundler'
end

# mecab
%w(build-essential mecab mecab-ipadic-utf8 libmecab-dev).each do |p|
  package p do
    action :install
  end
end

# mecab-ruby
mecab_version = '0.996'
execute 'mecab-ruby' do
  cwd '/tmp'
  command <<-EOC
    wget https://mecab.googlecode.com/files/mecab-ruby-#{mecab_version}.tar.gz
    tar zxvf mecab-ruby-#{mecab_version}.tar.gz
    cd mecab-ruby-#{mecab_version}
    gem build mecab-ruby.gemspec
    sudo gem install mecab-ruby-0.99.gem
  EOC
end

# nokogiri
execute 'libxml2' do
  cwd '/tmp'
  command <<-EOC
    wget http://xmlsoft.org/sources/libxml2-2.8.0.tar.gz
    tar zxvf libxml2-2.8.0.tar.gz
    cd libxml2-2.8.0
    ./configure
    make
    sudo make install
  EOC
  not_if 'test -e /usr/local/include/libxml2/'
end
%w(zlib1g-dev libxslt-dev).each do |p|
  package p do
    action :install
  end
end

# sqlite3
package 'libsqlite3-dev' do
  action :install
end

# deploy app
app_dir = '/srv/apps'
['/var/log/appreviews', app_dir].each do |dir|
  directory dir do
    action :create
    mode '2755'
    owner ENV['AWS_SSH_USERNAME']
    group ENV['AWS_SSH_USERNAME']
  end
end

# TODO...
# appreviews_dir = "#{app_dir}/appreviews"
# git appreviews_dir do
#   repository 'https://github.com/BEST10developers/AppReviewViewer'
# end
#
# execute 'run app' do
#   cwd appreviews_dir
#   command <<-EOC
#     bundle config build.nokogiri --use-system-libraries --with-xml2-include=/usr/local/include/libxml2
#     bundle install --path=vendor/bundle
#     bundle exec unicorn -c unicorn.rb -D
#   EOC
# end
