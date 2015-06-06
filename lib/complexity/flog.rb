class Flog
  
  def self.kick_off
    # Run Flog and take everything it gives
    o = %x{flog #{$path} }
    $output_file.puts(o)
  end
  
end