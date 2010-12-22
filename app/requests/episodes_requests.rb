module EpisodesRequests
  
  get '/episodes/new' do
    redirect '/' unless session[:user]
    haml :episodes_new
  end
  
  post '/episodes/create' do
    redirect '/' unless session[:user]
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