#!/usr/bin/perl

use strict;

use Getopt::Long;
use HTML::TagTree;

my %opts;

&Main();

sub Main{
   $SIG{'INT'} = sub { exit(0) };      # force performing of END block on control c.
   &process_command_line_options();


   print HTML::TagTree::get_doctype();
   my $html = HTML::TagTree->new('html');
   $html->print_html(0,1);
   $html->release();
   sleep 0;
}


sub process_command_line_options{

	my $return = GetOptions(
		'begin=s'      => \$opts{begin},
		'end=s'        => \$opts{end},
		'help'			=> \$opts{help},
	);

	if (defined $opts{help}) {
		print "Help for using .pl\n";
		print "Arguments:\n";
		print "  -help\n  This help screen.\n\n";
		print "  -begin YYYYMMDDHHMM\n\n";
		exit;
	}
	return $return;
}


sub Log{
}

sub BEGIN{
   # Uncomment the following in order to get the debugger to debug the this routine
   # $DB::single = 1;, 
   
   # Log Program Start
   my $args = join ' ', @ARGV;
   &Log("Starting w/ args:\n   $args");
}

sub END{
   &Log('End');

}

__END__

Put notes here

=head1 USAGE



