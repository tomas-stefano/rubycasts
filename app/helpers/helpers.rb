class RubyCasts
  module Helpers
		def partial(name, options = {})
			haml "_#{name}".to_sym, options.merge!(:layout => false)
		end

    def authenticate_user!
      if session[:user]
      else
        redirect '/'
      end
    end

  end
end