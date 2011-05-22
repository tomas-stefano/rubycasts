# coding: utf-8

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
  
  post '/:episode_id/comments/create' do
    login_required!
    @comment = current_user.comments.new(:body => params['body'], :episode_id => params['episode_id'])
    if @comment.save
      flash[:notice] = 'Comentário criado com sucesso!'
      redirect back
    else
      # ...
    end
  end

end