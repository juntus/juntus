source 'http://rubygems.org'
ruby "1.9.3"

gem 'rails',                '3.2.8'
gem 'jquery-rails',         '2.1.3'
gem 'haml-rails',           '0.3.4'
gem 'thin',                 '1.3.1'
gem 'pg',                   '0.14.0'
gem 'rack-canonical-host',  '0.0.8'
gem 'omniauth',             '1.1.1'
gem 'omniauth-facebook',    '1.4.1'
# gem 'paperclip', '3.0.4'
# gem 'aws-sdk', '1.5.2'
# gem 'paranoia', '1.1.0'
# gem 'typus', '3.1.10'
# gem 'kaminari', '0.13.0'
# gem 'rdiscount', '1.6.8'
# gem 'acts_as_hashed', '0.0.2'

group :assets do
  gem 'sass-rails',         '3.2.5'
  gem 'coffee-rails',       '3.2.2'
  gem 'uglifier',           '1.3.0'
end

group :development do
  gem 'heroku',             '2.28.12'
  gem 'integration', :git => 'git://github.com/mergulhao/integration.git'
end

group :test do
  gem 'fakeweb',            '1.3.0'
  gem 'shoulda-matchers',   '1.1.0'
  gem 'timecop',            '0.3.5'
  gem 'simplecov', '0.6.1', :require => false
  # gem 'guard-rspec', '2.1.0'
end

group :development, :test do
  gem 'rspec-rails',        '2.11.0'
  gem 'factory_girl_rails', '1.7.0'
  gem 'pry-rails',          '0.1.6'
  gem 'awesome_print',      '1.0.2'
  gem 'guard',              '1.3.3'
  gem 'guard-rspec',        '1.2.1'
  gem 'rb-fsevent'
end