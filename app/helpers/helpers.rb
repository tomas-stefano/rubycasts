module Helpers
	def partial(name, options = {})
		haml "_#{name}".to_sym, options.merge!(:layout => false)
	end

  def authenticate_user!
    unless session[:user]
      redirect '/'
    end
  end

end