# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'dotenv'
Dotenv.load
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'
require 'twilio-ruby'
require 'sinatra'
require "sinatra/reloader" if development?
require 'pony'
require 'mail'
require 'erb'
require 'faker'
require 'bcrypt'
require 'pry-byebug'
require 'segment/analytics'

Analytics = Segment::Analytics.new({
    write_key: ENV['SEGMENT_KEY'],
    on_error: Proc.new { |status, msg| print msg }
})

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

MAP_KEY = ENV['MAP_KEY']
WEATHER_KEY = ENV['WEATHER_KEY']
TWILIO_SID = ENV['TWILIO_SID']
TWILIO_TOKEN = ENV['TWILIO_TOKEN']
SMTP_USER = ENV['SMTP_USER']
SMTP_PASS = ENV['SMTP_PASS']

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')
