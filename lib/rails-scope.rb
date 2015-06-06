require 'optparse'
require 'security/brakeman'

class RailsScope
  
  attr_reader :options
  
  def self.run
    @options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: rails-scope [options]"
      
      opts.on("-p", "--path /var/app/current", "Path to your application directory") do |p|
        @options[:path] = p
      end

      opts.on("-h", "--help", "Displays help information") do
        puts opts 
        exit
      end
    end.parse!
    start
  end
  
  def self.start
    $path = @options[:path] ? @options[:path] : Dir.pwd
    Brakeman.kick_off
  end
  
end