# Files and folders which shouldn't be copied over
EXCLUDE = [
  '.git',
  '.gitignore',
  '.rvmrc',
  'Gemfile',
  'Gemfile.lock',
  'Rakefile',
  'README.textile'
]

# Files
def entries
  @files ||= Dir['**/{.*,*}'].reject {|f| f =~ /\.$/ || File.directory?(f) } - EXCLUDE
end

desc 'Backup previous dotfiles.'
task :backup do
  target_rootdir = FileUtils.mkdir_p( File.expand_path( File.join( '~' , '.dotfiles-backup', Time.now.to_s ) ) )
  entries.each do |file|
    source = File.expand_path( "~/#{file}" )
    target = "#{target_rootdir}/#{file}"
    target_dir = File.dirname(target)
    FileUtils.mkdir_p(target_dir, :verbose => true) unless File.exists?(target_dir)
    FileUtils.cp_r(source, target, :verbose => true) if File.exists?(source)
  end
end

desc 'Copy dotfiles over to home dir.'
task :install do
  entries.each do |file|
    target = File.expand_path( "~/#{file}" )
    target_dir = File.dirname(target)
    FileUtils.mkdir_p(target_dir, :verbose => true) unless File.exists?(target_dir)
    FileUtils.cp_r(file, target, :verbose => true, :remove_destination => true)
  end
end

task :default => [:backup, :install]
