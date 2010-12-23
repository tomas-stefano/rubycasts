module Helpers
	def partial(name, options = {})
		haml "_#{name}".to_sym, options.merge!(:layout => false)
	end
	
	def erb_partial(name, options={})
	 erb "_#{name}".to_sym, options.merge!(:layout => false)
	end
	
	def current_rubycasts_user
    @current_rubycasts_user ||= User.first(:token => request.cookies[:token]) if request.cookies[:token]
	end

end