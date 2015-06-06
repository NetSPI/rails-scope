class Brakeman
  
  def self.kick_off
    # run brakeman and generate report
    output_file = "#{$tmpdir}/bman.html"
    system *%W{ brakeman $path -o #{output_file} }
  end
  
end