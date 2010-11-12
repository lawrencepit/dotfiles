require 'erb'

# Files that shouldn't be copied
EXCLUDE = [
  '.git',
  '.gitignore',
  '.rvmrc',
  'Dotfile',
  'Gemfile',
  'Gemfile.lock',
  'Rakefile',
  'README.textile'
]

# Files that should be copied
def files
  @files ||= Dir['**/{.*,*}'].reject {|f| f =~ /\.$/ || File.directory?(f) } - EXCLUDE
end

# See file Dotfile
class Dotfiles
  @@conf = Dotfiles.new
  def self.conf ; @@conf ; end
  def getBinding ; binding ; end
  def self.load(file)
    @@conf.instance_eval(File.read(file)) if File.exists?(file)
  end
  def method_missing(method, *args, &block)
    instance_variable_get(:"@#{method}") || "Enter your #{method}"
  end
end

# Copy file to target. If it's an .erb file evaluate it first.
def install(file, target)
  if File.extname(file) == '.erb'
    target = target.sub(/\.erb$/, '')
    template_data = ERB.new(IO.read(file)).result(Dotfiles.conf.getBinding)
    File.open(target, "w") { |t| t.puts(template_data) }
    File.chmod(File.stat(file).mode, target)
    puts "erb -r --remove-destination #{file} #{target}"
  else
    FileUtils.cp_r(file, target, :verbose => true, :remove_destination => true)
  end
end

desc 'Backup previous dotfiles.'
task :backup do
  target_rootdir = FileUtils.mkdir_p( File.expand_path( File.join( '~' , '.dotfiles-backup', Time.now.to_s ) ) )
  files.each do |file|
    source = File.expand_path( "~/#{file}" )
    target = "#{target_rootdir}/#{file}"
    target_dir = File.dirname(target)
    FileUtils.mkdir_p(target_dir, :verbose => true) unless File.exists?(target_dir)
    FileUtils.cp_r(source, target, :verbose => true) if File.exists?(source)
  end
end

desc 'Remove backup dotfiles'
task :clean do
  FileUtils.rm_rf(File.expand_path(File.join( '~' , '.dotfiles-backup')))
end

desc 'Copy dotfiles over to home dir.'
task :install do
  Dotfiles.load(File.expand_path("Dotfile"))
  files.each do |file|
    target = File.expand_path( "~/#{file}" )
    target_dir = File.dirname(target)
    FileUtils.mkdir_p(target_dir, :verbose => true) unless File.exists?(target_dir)
    install(file, target)
  end
end

task :default => [:backup, :install]
