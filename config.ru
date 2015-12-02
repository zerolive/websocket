# This file is used by Rack-based servers to start the application.
require 'faye'

require ::File.expand_path('../config/environment', __FILE__)


Faye::WebSocket.load_adapter('thin')
app = Faye::RackAdapter.new(:mount => '/faye', :timeout => 45)

run Rack::URLMap.new("/" => Rails.application, "/faye" => app)