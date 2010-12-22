module ApplicationLogger
  def logger_file!
    logger_filename = "logs/rubycasts.log"
    logger_file = File.open(logger_filename, 'a+')
    logger_file.sync = true
    DataMapper::Logger.new(logger_file, :debug)
    logger_file
  end
end