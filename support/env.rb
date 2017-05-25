
require 'page-object'
require 'data_magic'
require 'require_all'
#require 'logger'
require 'selenium-webdriver'
#require 'ruby-debug'
gem 'pry', '~> 0.10.4'
#require_all 'lib'
#require 'cucumber/rails'
require 'rspec'
#require 'rspec/expectations'
require 'java'
require 'watir-webdriver'
require 'headless'
require 'rubygems'
require 'pry-debugger-jruby'
##require '../lib/jarfiles/db2driver-9.5.jar'

require 'data_magic'
#require 'java'
#require 'logger'
#require 'open-uri'
#require 'page-object'
#require 'random_data'
#require 'require_all'
#require 'rspec'
#require 'rspec/expectations'
#require 'savon'
#require 'selenium-webdriver'
#require 'uuid'
#require 'win32/screenshot' if ExecutionEnvironment.host_os == :windows
#require 'yaml'

require_all 'features/step_definitions'
require_all 'lib'


World(PageObject::PageFactory)
PageObject.default_page_wait = 90
PageObject.default_element_wait = 20
