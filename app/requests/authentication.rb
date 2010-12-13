
module Authentication
  get '/sign_in/rubycasts' do
    haml :sign_in
  end
  post '/try_to_login' do
    flash[:notice] = "Sign in!"
    haml :dashboard
  end
end