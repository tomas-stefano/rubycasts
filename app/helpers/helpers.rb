module Helpers

	def partial(name, options = {})
		haml "_#{name}".to_sym, options.merge!(:layout => false)
	end
	
	def current_rubycasts_user
    # @current_user ||= User.first(:token => request.cookies[:token]) if request.cookies[:token]
	end
	
	def admin_required!
	  redirect '/' unless session['user_id']
	  if user = User.get(session['user_id'])
	    redirect '/' unless user.admin?
    else
      redirect '/'
    end
	end

end