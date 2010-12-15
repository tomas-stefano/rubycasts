class RubyCasts
  module Helpers
		def partial(name, options = {})
			haml "_#{name}".to_sym, options.merge!(:layout => false)
		end
  end
end