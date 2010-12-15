module EpisodesRequests
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