require 'sinatra'

get '/meta' do
  erb :application, locals: {metas: params}
end
