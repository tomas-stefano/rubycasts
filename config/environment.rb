class Configuration
  # call block in the scope of configuration instance
  #
  def self.config
    yield Configuration.new
  end

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
    DataMapper.auto_upgrade!
  end
  
  def omni_auth
    file = File.expand_path(File.join(File.dirname(__FILE__), 'production.yml'))
    YAML.load_file(file)
  end
  
end