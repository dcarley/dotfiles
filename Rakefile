require 'rake'
require 'pathname'

task :default do
  exclude = /(\.\.?|\.git|Rakefile)$/
  rake_dir = Pathname.new(__FILE__).parent
  target_dir = Pathname.new(ENV["HOME"])
  source_dir = Pathname.new(rake_dir).relative_path_from(target_dir)

  FileList[".*", "*"].exclude(exclude).each do |dotfile|
    target = File.join(target_dir, dotfile)
    source = File.join(source_dir, dotfile)
    source_abs = File.join(rake_dir, dotfile)

    if File.symlink?(target) and File.readlink(target) == source
      next
    end

    if File.exist?(target) or File.symlink?(target)
      puts "Replacing #{target}"
      File.unlink(target)
    end

    puts "Linking #{target}"
    File.symlink(source, target)
  end
end
