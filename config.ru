# This file is used by Rack-based servers to start the application.
WEBSITE_SUBDIR = 'server'
require "#{WEBSITE_SUBDIR}/config/environment"
run Bestmix::Application
