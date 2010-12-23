module OmniAuthRequests
  get '/auth/github/callback' do
    user = request.env['omniauth.auth']
  end
end