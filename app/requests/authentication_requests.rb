
module AuthenticationRequests

  before '/episodes/*' do
    authenticate_user!
  end

  get '/sign_in' do
    haml :sign_in
  end

  post '/try_to_login' do
    @user = User.authenticate!(params)
    flash[:notice] = 'Sign in!'
    haml :dashboard
  end
  
end
