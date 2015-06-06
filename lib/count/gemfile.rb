class Gemfile
  
  def self.kick_off
    gemfile = "#{$path}/Gemfile"
    if File.exists?(gemfile)
      $output_file.puts File.read(gemfile)
    end
  end
  
end