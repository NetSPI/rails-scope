class Brakeman
  
  def self.kick_off
    # run brakeman and generate report
    o = %x{ brakeman #{$path} --summary }
    $output_file.puts(o)
  end
  
end