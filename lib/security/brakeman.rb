class Brakeman
  
  def self.kick_off
    # run brakeman and generate report
    o = %x{ brakeman #{$path} --summary }
    $output_file.puts(o)
    $output_file.puts("\n====\n")
  end
  
end