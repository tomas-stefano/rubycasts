module EpisodesRequests
  
  get '/episodes/new' do
    admin_required!
    haml :episodes_new
  end
  
  post '/episodes/create' do
    admin_required!
    @episode = Episode.new(params)
    if @episode.save
      flash[:notice] = "Create Episode!"
      redirect '/'
    end
  end
  
  get '/episodes/:id' do
    @episode = Episode.get(params[:id])
    redirect '/' unless @episode
    haml :episodes_show
  end

end