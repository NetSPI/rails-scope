class CodeCount
  
  attr_accessor :directories, :files, :entries
  attr_reader :target_dir
  
  def self.kick_off
    @directories = []
    @files = []
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


  # This method is just hideous but... hackathon = mvp
  def self.collect_assets
    @entries = Dir.entries @target_dir 
    @entries.delete_if {|dir| uninteresting_directories.include? dir }
    @entries.each do |top_level_dir|
      files_and_folders = Dir.glob("#{@target_dir}/#{top_level_dir}/**/*") 
      assets = files_and_folders.each do |file_or_fold| 
        if File.directory?(file_or_fold)
          @directories << file_or_fold
        elsif File.file?(file_or_fold)
          @files << file_or_fold
        end
      end
    end
  end
  
  def self.print_out_info
    ['directories', 'files'].each_with_index do |item, idx|
       $output_file.puts("The following are the names of the #{item.capitalize}: ")
       $output_file.puts("-" * 30)
       instance_variable_get("@#{item}").each do |asset|
         $output_file.puts asset
       end
       $output_file.puts("\n")
    end
    
    # Being Duplication that really should be fixed
    $output_file.puts("The following is the individual file LoC: ")
    $output_file.puts("-" * 30)
    $output_file.puts("\n")
    @files.each do |file|
      $output_file.puts(loc_in_file(file))
    end
    $output_file.puts("\n")
    $output_file.puts("The following is the LoC for folders under the app directory: ")
    $output_file.puts("-" * 30)
    $output_file.puts("\n")
    @entries.each do |entry|
      $output_file.puts("#{loc_in_dir(entry)[/(\d+ total)/]}: #{entry}")
    end
  end
  
  def self.loc_in_file(file)
    %x{wc -l #{file} }
  end
  
  def self.loc_in_dir(dir)
     %x{find . #{@target_dir}/#{dir} |xargs wc -l }
   end
  
  
  def self.create_count
    collect_assets
    print_out_info
  end

end