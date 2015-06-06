class Flay
  
  def self.kick_off
    # I only want the summary with Flay
    o = %x{flay #{$path} -s }
    $output_file.puts(o)
  end
  
end