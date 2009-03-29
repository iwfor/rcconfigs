#!/usr/bin/env perl

use strict;

my $ports = [
             {
              '/opt/local/bin/git' => 'git-core +svn',
              '/opt/local/bin/lftp' => 'lftp',
              '/opt/local/bin/7za' => 'p7zip',
              '/opt/local/bin/ruby' => 'ruby',
              '/opt/local/bin/svn' => 'subversion',
              '/opt/local/bin/zsh' => 'zsh-devel'
             },
             {
              '/opt/local/bin/aspell' => 'aspell',
              '/opt/local/bin/emacsclient' => 'emacs +atsui +carbon',
              '/opt/local/bin/gpg' => 'gnupg',
              '/opt/local/bin/ispell' => 'ispell'
             },
             {
              '/opt/local/lib/postgresql83/bin/postmaster' => 'postgresql83-server',
              '/opt/local/bin/sloccount' => 'sloccount',
              '/opt/local/bin/mogrify' => 'ImageMagick'
             },
             {
              '/opt/local/lib/ruby/vendor_ruby/1.8/i686-darwin9/postgres.bundle' => 'rb-postgres'
             }
            ];

my @errors;
foreach my $batch (@$ports) {
  foreach my $path (sort keys %$batch) {
    my $type = (-e $path) ? 'upgrade' : 'install';
    my $cmd = "port $type $$batch{$path}";
    print "===> Running: $cmd\n";
    my $rval = system($cmd);
    if ($rval != 0) {
      push @errors, "Failed to install $$batch{$path}: $rval";
    }
    else {
      my $shortname = $$batch{$path};
      $shortname =~ s/ .*//;
      if (-e "post/$shortname") {
        $cmd = "post/$shortname";
        print "===> Running $cmd\n";
        system($cmd);
      }
    }
  }
}

if (@errors) {
  print "\n\nErrors occured:\n";
  print "$_\n" foreach (@errors);
}
