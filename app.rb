require 'sinatra'
require 'sinatra/reloader'
require "better_errors"

# configure :development do
#   use BetterErrors::Middleware
#   BetterErrors.application_root = __dir__
# end

get '/meta' do
  erb :application, locals: {request_url: request.url, metas: params}
end
