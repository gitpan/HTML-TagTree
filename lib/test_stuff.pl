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
   my $html = HTML::TagTree->new('html','', 'xmlns=http://www.w3.org/1999/xhtml xml:lang=en lang=en');
   my $head = $html->head();
   my $body = $html->body();
   
   $head->title("This is the Title of Gary's Page, the opening title of Gary's page...");
   $head->meta('', 'name=author CONTENT="Dan DeBrito"');
   
   my $table = $body->table('', 'width=100% border=1');
   my $row1 = $table->tr();
   my $row2 = $table->tr();
   $table->tr('','id=row3')->td->b('and beautiful');
   $row1->td('This is content for row 1 td1','id=cell_bot');
   $row2->td('This is content for row 2 td1','id=buy_bot');
   my $logo = $row1->td('Acme Macines', 'height=60');
   $body->div('','id=hi onclick=alert("Hello");')->h1('Click Me');;
   $html->print_html();
   $html->release();
   print "Version: " . HTML::TagTree::version() . "\n";
   my $xml = HTML::TagTree->new('xml');
   $xml->set_valid_tags(['aaa','bbb','ccc']);
   $xml->aaa->bbb->ccc;
   $xml->add_valid_tags('ddd');
   $xml->ddd('','x=less');
   $xml->print_html();
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
   my $msg = shift;
   if ($msg !~ m/\n$/) {
      $msg .= "\n";
   }
   my $log_file = $0 . '.log';
   if (open my $LF, ">>$log_file") {
      print $LF scalar localtime, "\n ";
      print $LF $msg;
      close $LF;
   }
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



