class RubyCasts
  def self.config
    yield Configuration.new
  end
  
  # Settings for the Sinatra Application
  #
  module Settings
    use Rack::Session::Cookie, :secret => "3dd410929706203fe6fe008ca1cc721450609746"
    use Rack::Flash
    use Rack::ShowExceptions
    
    set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
    set :views, Proc.new { File.join(root, 'app', "views") }
    set :public, Proc.new { File.join(root, "public") }
    
    set :logging, false
    LOGGER_FILENAME = "logs/rubycasts.log"
    LOGGER_FILE = File.open(LOGGER_FILENAME, 'a+')
    LOGGER_FILE.sync = true
    use Rack::CommonLogger, LOGGER_FILE
  end
  
  class Configuration
    
    # Pass many strings that will be include in the load path and require
    # all ruby files in the specified dir
    #
    def load_paths=(dirs)
      dirs.each do |dir|
        directory = File.expand_path(dir)
        $LOAD_PATH.unshift(directory) unless $LOAD_PATH.include?(directory)
        Dir["#{directory}/*.rb"].each { |file| require file }
      end
    end
    
    # Configurations for Datamapper
    #
    def datamapper(adapter_name, options)
      DataMapper.setup(adapter_name, options)
      DataMapper.auto_migrate!
    end
    
  end
end