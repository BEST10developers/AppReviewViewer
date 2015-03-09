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

# mecab
%w(build-essential mecab mecab-ipadic-utf8 libmecab-dev).each do |p|
  package p do
    action :install
  end
end

# mecab-ruby
mecab_version = '0.996'
execute 'mecab-ruby' do
  command <<-EOC
    cd /tmp
    wget https://mecab.googlecode.com/files/mecab-ruby-#{mecab_version}.tar.gz
    tar zxvf mecab-ruby-#{mecab_version}.tar.gz
    cd mecab-ruby-#{mecab_version}
    gem build mecab-ruby.gemspec
    sudo gem install mecab-ruby-0.99.gem
  EOC
end
