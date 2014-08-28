require 'sinatra'

class Application < Sinatra::Base

  configure do
    set :root, File.dirname(__FILE__)
    set :static, true
    set :template, :haml
    enable :raise_errors
  end

  get '/' do
    haml :index
  end

  get '/iframe_1' do
    haml :iframe_1
  end

  get '/iframe_2' do
    haml :iframe_2
  end

end
