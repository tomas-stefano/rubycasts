require File.expand_path('config/application')
require 'authentication'

class RubyCasts
  include Authentication
  include Settings
  
  helpers do
    include Rubycasts::Helpers
  end

  get '/' do
    haml :index
  end

  get '/about' do
    haml :about
  end
  
  get '/contact' do
    haml :contact
  end

  get '/admin/upload' do
    haml :upload
  end

  get '/stylesheets/application.css' do
    content_type "text/css"
    sass :application
  end
  
  get '/upload_episode' do
    haml :upload_episode
  end

  post '/proposta' do
    # proposta = Proposta.new(params)
    #     
    # if proposta.valid?
    #   proposta.save
    #   env['x-rack.flash'][:notice]  = '<p>Proposta enviada com sucesso.</p>'
    #   redirect '/'
    # else
    #   errors = []
    #   proposta.errors.each do |e|
    #     errors << "#{e}<br />"
    #   end
    #   env['x-rack.flash'][:notice]  =  "<p class=\"error\">#{errors}</p>"
    #   redirect '/'
    # end
  end

end
