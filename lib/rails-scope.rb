require 'optparse'
require 'tmpdir'
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
    $path   = @options[:path] ? @options[:path] : Dir.pwd
    $output_path = @options[:output] ? @options[:output] : Dir.pwd
    $output_file = File.new("#{$output_path}/scope.nv", "w")
    $tmpdir = Dir.mktmpdir
    %w{ Brakeman }.each do |klass|
      obj = Object.const_get(klass)
      obj.kick_off
    end
  ensure 
    clean_up
  end
  
  def self.clean_up
   puts "#{$output_file}"
   $output_file.close
  ensure
    FileUtils.remove_entry_secure $tmpdir if !$tmpdir.nil? && Dir.exists?($tmpdir)
  end
  
end