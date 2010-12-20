module EpisodesRequests
  
  before '/episodes/*' do
    authenticate_user!
  end
  
  get '/episodes/new' do
    haml :episodes_new
  end
  
  post '/episodes/create' do
    @episode = Episode.new(params)
    if @episode.save
      flash[:notice] = "Create Episode!"
      redirect '/'
    end
  end
end