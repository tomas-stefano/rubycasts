module OmniAuthRequests
  get '/auth/github/callback' do
    request.env['omniauth.auth']
  end
end