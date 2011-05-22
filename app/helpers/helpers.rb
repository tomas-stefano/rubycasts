module Helpers

	def partial(name, options = {})
		haml "_#{name}".to_sym, options.merge!(:layout => false)
	end
	
	def current_user
    @current_user ||= User.first(:token => session[:token], :github_uid => session[:github_uid]) if session[:token] and session[:github_uid]
	end
	
	def admin_required!
    login_required!
	  if user = User.get(session[:github_uid])
	    redirect '/' unless user.admin? or user.token != session[:token]
    else
      redirect '/'
    end
	end
	
	def login_required!
	 	redirect '/' unless session[:github_uid]
	end
	
	def show_code(code)
	  code = code.strip
	  CodeRay.scan(code, :ruby).div(:css => :class) # ruby for now TODO: Change to all lang
	end
	
	def gravatar_url(comment)
	 "http://gravatar.com/avatar/#{comment.user.gravatar_id}.png"
	end
	
	def show_notes(notes)
	 Redcarpet.new(notes, :filter_html, :hard_wrap, :autolink).to_html
	end

end