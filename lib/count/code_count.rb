class CodeCount
  
  attr_reader :target_dir
  
  def self.kick_off
    # We need to get the line of code_count, directory count, file count, and 
    # ...names from the app dir
    @target_dir = "#{$path}/app"
    if Dir.exist?(@target_dir)
      create_count
    else
      $output_file.puts("We weren't able to find the app/ directory looking here: #{@target_dir}")
    end
  end
  
  def self.uninteresting_directories
    %w{ . .. assets }
  end

  def self.collect_directories
    entries = Dir.entries @target_dir 
    entries.delete_if {|dir| uninteresting_directories.include? dir }
    puts entries
  end
  
  def self.collect_files
  end
  
  def self.loc_in_file(file)
  end
  
  def self.create_count
    collect_directories
  end

end