#!/usr/bin/env ruby

period_dir = File.expand_path('.')
$LOAD_PATH.unshift(period_dir) unless $LOAD_PATH.include?(period_dir)
require 'config/application'

run Sinatra::Application
