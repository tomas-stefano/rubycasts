module Helpers

	def partial(name, options = {})
		haml "_#{name}".to_sym, options.merge!(:layout => false)
	end
	
	def current_rubycasts_user
    # @current_user ||= User.first(:token => request.cookies[:token]) if request.cookies[:token]
	end
	
	def admin_required!
	  redirect '/' unless session['github_uid']
	  if user = User.get(session['github_uid'])
	    redirect '/' unless user.admin? or user.token != session['token']
    else
      redirect '/'
    end
	end

end