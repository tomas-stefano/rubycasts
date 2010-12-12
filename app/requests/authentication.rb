
module Authentication
  get '/sign_in/rubycasts' do
    haml :sign_in
  end
  post '/sign_in_rubycasts' do
    'Sign in!'
  end
end