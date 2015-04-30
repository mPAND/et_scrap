##############################################################################
##
## Name    : 01_et_scrap.pl
##
## Purpose : To download Economic Times News Paper as PDF
##           for offline reading
##  
## Syntax  : perl 01_et_scrap.pl [R/M/A] [YYYYMMDD]
## 
##           where R - Regular News Paper
##                 M - Supplement Magazine
##                 A - All ( Regular + Supplement)
## Details : 
##     Economic Times provides Regular Newspaper on all days
##     following by additional magazine on certain days
##
##     Monday     - ET Wealth
##     Wednesday  - Brand Equity
##     Thursday   - ET Travel , Panache
##     Friday     - Corporate Dossier
##
##   This script helps to download either news paper or magazine or both
## 
##   Passing No Arguments will download current days magazine if present
##
##   Passing 1 argument - R  -- Will download current days news paper
##   Passing 1 argument - A  -- Will download current days magazine and news paper
##   Passing 1 argument - M  -- Will download current days magazine only
##
##   Passing 2 argument - R/M/A YYYYMMDD will download particular days paper/magazine/both 
## 
###############################################################################

use strict;
use warnings;
use diagnostics;

use feature 'say';

use LWP::Simple;
use POSIX qw(strftime);
use Time::Piece;
use Digest::MD5 qw/md5_hex/;

my $url_demo = 'http://epaperbeta.timesofindia.com/NasData//PUBLICATIONS/THEECONOMICTIMES/BANGALORE/2015/04/20/Page/20_04_2015_102.jpg';
my $url_static = 'http://epaperbeta.timesofindia.com/NasData//PUBLICATIONS/THEECONOMICTIMES/BANGALORE/';
my $dt_epoch;
my $mag_type;
my @doc_header;

if (@ARGV > 1 ) {
 my $dt_ip = Time::Piece->strptime($ARGV[1], "%Y%m%d");
 $dt_epoch = $dt_ip->epoch;
 say "Checking for ".$dt_ip->strftime("%a, %d %b %Y")." News Paper";
 $mag_type = $ARGV[0]; 
} else {
 $dt_epoch = time();
 say "Checking for Today's News Paper";
 $mag_type = $ARGV[0] if (@ARGV eq 1) ;
 $mag_type = 'M' if (@ARGV eq 0) ;
}



sub get_ET_pdf  {
	my $dt = shift;
	my $counter = shift;
	my $downloaded=0;
my $dt_YYYY_MM_DD = strftime "%Y/%m/%d", localtime($dt);
my $dt_dd_mm_YYYY = strftime "%d_%m_%Y", localtime($dt);

my $dt_tp = localtime($dt);

my $flag =1;

while ($flag >0)
{
my $counter_fmt = sprintf( "%03d",$counter);	
my $url_reg_jpg = $url_static.$dt_YYYY_MM_DD."/Page/".$dt_dd_mm_YYYY."_".$counter_fmt.".jpg";
my $url_reg_pdf = $url_static.$dt_YYYY_MM_DD."/PagePrint/".$dt_dd_mm_YYYY."_".$counter_fmt.'_'.md5_hex($dt_dd_mm_YYYY."_".$counter_fmt.'_pressguess').".pdf";

@doc_header = head($url_reg_jpg);

if ( defined($doc_header[0]) ){
		if ( $doc_header[0] eq "image/jpeg")
		{
		my $file_name_jpg = $dt_dd_mm_YYYY.'_'.$counter_fmt.'.jpg';
		my $file_name_pdf = $dt_dd_mm_YYYY.'_'.$counter_fmt.'.pdf';
	
	#	getstore($url_reg_jpg,$file_name_jpg);
		getstore($url_reg_pdf,$file_name_pdf);
		$counter++;
		$downloaded++;
	    }
    }    
    else {
          $flag=0;
        }
   }
return $downloaded; 
}

my $dt_ts = localtime($dt_epoch);

#
# Notes days_of_week explained
# - 0 - sunday
# - 1 - monday
# - 2 - tue
# - 3 - wed
# - 4 - thu
# - 5 - fri
# - 6 - sat
##
## ET Magazine schedule
## ET - all days regular 
## Mon - ET Market - 101
## Wed - Brand Eq - 151
## Thu - Travel - 201 , Panache - 301
## Fri - CD - 250

get_ET_pdf ($dt_epoch,1) if ($mag_type eq 'R' or $mag_type eq 'A');

if ($mag_type eq 'M') 
{

say "Checking for ".$dt_ts->fullday." Magazine";

my $dw= $dt_ts->day_of_week;
my $count;
use 5.10.0;
given ($dw){
	when(1){
	$count=get_ET_pdf ($dt_epoch , 101);
	if ($count) { say "Downloaded $count Pages";}
	}
	when(3){
	$count=get_ET_pdf ($dt_epoch , 151);
	if ($count) { say "Downloaded $count Pages";}
	}
	when(4){
	$count=get_ET_pdf ($dt_epoch , 201);
	if ($count) { say "Downloaded $count Pages";}
	$count=get_ET_pdf ($dt_epoch , 301);
	if ($count) { say "Downloaded $count Pages";}
	}
	when(5){
	$count=get_ET_pdf ($dt_epoch , 251);
	if ($count) { say "Downloaded $count Pages";}
	}
  }
}

say "END OF PROGRAM";
