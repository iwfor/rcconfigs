#!/usr/bin/env ruby

ports = [
  {
    '/opt/local/bin/git' => 'git-core +svn',
    '/opt/local/bin/lftp' => 'lftp',
    '/opt/local/bin/7za' => 'p7zip',
    '/opt/local/bin/ruby' => 'ruby',
    '/opt/local/bin/svn' => 'subversion',
    '/opt/local/bin/zsh' => 'zsh-devel'
  },
  {
    '/opt/local/bin/gem' => 'rb-rubygems',
    '/opt/local/bin/rails' => 'rb-rails',
    '/opt/local/lib/ruby/gems/1.8/bin/mongrel_rails' => 'rb-mongrel',
    '/opt/local/bin/aspell' => 'aspell',
    '/opt/local/bin/emacsclient' => 'emacs +atsui +carbon',
    '/opt/local/bin/gpg' => 'gnupg',
    '/opt/local/bin/ispell' => 'ispell'
  },
  {
    '/opt/local/lib/postgresql83/bin/postmaster' => 'postgresql83-server',
    '/opt/local/bin/sloccount' => 'sloccount',
    '/opt/local/bin/mogrify' => 'ImageMagick',
    '/opt/local/lib/ruby/gems/1.8/gems/gd2-*' => 'rb-gd2'
  },
  {
    '/opt/local/lib/ruby/vendor_ruby/1.8/i686-darwin9/postgres.bundle' => 'rb-postgres'
  }
];

gems = [
  {'/opt/local/lib/ruby/gems/1.8/gems/wirble-*' => 'wirble'}
];

errors = []
ports.each do |batch|
  batch.keys.sort.each do |pathspec|
    type = Dir.glob(pathspec).empty? ? 'install' : 'upgrade'
    port = batch[pathspec]
    cmd = "port #{type} #{port}"
    puts "### Running: #{cmd}"
    rval = system cmd
    unless rval
      errors << "Failed to #{type} #{port}: #{$?}"
    else
      shortname = port.sub(/[@ ].*/, '')
      postrundir = (type == 'install') ? 'postinstall' : 'postupgrade';
      postscript = File.join postrundir, shortname
      if File.exists? postscript
        cmd = postscript
        puts "===> Running #{cmd}"
        system cmd;
      end
    end
  end
end

if File.exists? '/opt/local/bin/gem'
  puts "### Installing/updating gems..."
  gems.each do |batch|
    batch.keys.sort.each do |pathspec|
      type = Dir.glob(pathspec).empty? ? 'install' : 'update'
      gem = batch[pathspec]
      cmd = "gem #{type} #{gem}";
      rval = system cmd
      unless rval
        errors << "Failed to #{type} #{gem}: #{$?}"
      end
    end
  end
end

if errors.empty?
  puts "### No errors"
else
  puts "\n\nErrors occured:"
  errors.each do |err|
    puts "  #{err}"
  end
end
