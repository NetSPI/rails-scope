class Flog
  
  def self.kick_off
    o = %x{flog #{$path} }
    $output_file.puts(o)
  end
  
end