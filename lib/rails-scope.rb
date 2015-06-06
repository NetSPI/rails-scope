require 'optparse'
require 'tmpdir'
require 'security/brakeman'
require 'complexity/flog'
require 'complexity/flay'
require 'count/code_count'
require 'count/gemfile'

class RailsScope
  
  attr_reader :options
  
  def self.run
    @options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: rails-scope [options]"
      
      opts.on("-p", "--path /var/app/current", "Path to your application directory") do |p|
        @options[:path] = p
      end

      opts.on("-o", "--path /my/dir", "The location you would like the scope.nv file stored") do |o|
        @options[:output] = o
      end

      opts.on("-h", "--help", "Displays help information") do
        puts opts 
        exit
      end
    end.parse!
    start
  end
  
  def self.klasses
    %w{ Brakeman Flog Flay CodeCount Gemfile}
  end
  
  def self.separator(tool_name='')
    sep = tool_name == klasses.first ? "" : "\n"
    sep << "=" * 15
    sep << tool_name
    sep << "=" * 15
    sep << "\n\n"
    $output_file.puts sep
  end
  
  def self.start
    $path   = @options[:path] ? @options[:path] : Dir.pwd
    $output_path = @options[:output] ? @options[:output] : Dir.pwd
    $output_file = File.new("#{$output_path}/scope.nv", "w")
    $tmpdir = Dir.mktmpdir
    klasses.each do |klass|
      separator(klass.to_s)
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