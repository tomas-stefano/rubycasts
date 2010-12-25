module OmniAuthRequests
  get '/auth/github/callback' do
    provider = request.env['omniauth.auth']    
    @user = User.first(:github_uid => provider["uid"]) || User.create_from_omniauth!(provider)
    session[:token] = @user.token
    session[:github_uid] = @user.github_uid
    flash[:notice] = 'Logged In!'
    redirect back
  end
end