module OmniAuthRequests
  get '/auth/github/callback' do
    provider = request.env['omniauth.auth']
  end
end