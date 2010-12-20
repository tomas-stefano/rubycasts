
module AuthenticationRequests

  get '/sign_in' do
    haml :sign_in
  end

  post '/try_to_login' do
    @user = User.authenticate!(:email => params["email"], :password => params["password"])
    if @user
      session[:user] = @user.id
      flash[:notice] = 'Sign in!'
      redirect '/dashboard'
    else
      redirect '/'
    end
  end

  get '/dashboard' do
    authenticate_user!
    haml :dashboard
  end

end
