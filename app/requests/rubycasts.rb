current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(current_dir) unless $LOAD_PATH.include?(current_dir)

require 'config/application'

class RubyCasts

  use Rack::Session::Cookie, :secret => "3dd410929706203fe6fe008ca1cc721450609746"
  use Rack::Flash

  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
  set :environment, 'development'
  set :views, Proc.new { File.join(root, 'app', "views") }
  set :public, Proc.new { File.join(root, "public") }

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

  get '/sign_in/rubycasts' do
    haml :sign_in
  end

  post '/proposta' do
    proposta = Proposta.new(params)
    
    if proposta.valid?
      proposta.save
      env['x-rack.flash'][:notice]  = '<p>Proposta enviada com sucesso.</p>'
      redirect '/'
    else
      errors = []
      proposta.errors.each do |e|
        errors << "#{e}<br />"
      end
      env['x-rack.flash'][:notice]  =  "<p class=\"error\">#{errors}</p>"
      redirect '/'
    end  
    
  end
end
