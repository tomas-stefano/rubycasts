
module Authentication
  use Rack::Session::Cookie
  
  use OmniAuth::Builder do
    provider :github, RubyCasts::Configuration["client_id"], RubyCasts::Configuration["secret"]
  end
  
  enable :sessions

  get 'auth/:name/callback' do
    auth = request.env["omniauth.auth"]
    "Worked!"
  end

end