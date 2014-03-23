# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Uni::Application

use Rack::ReverseProxy do
  reverse_proxy(/^\/video(\/.*)$/,
    'http://www.youtube.com/embed/uGtTE6ijJaA',
    opts = {:preserve_host => true})
end
