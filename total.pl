#!/usr/bin/perl
use Encode;
binmode(STDOUT, ":utf8");

my $fiel=shift;
my %data=();
my $content; 
my $char;
open(FILE, "<", $file)  or die "cannot open < $file: $!";	
@lines = <FILE>; 
#去除\t
foreach $LINE (@lines) {  
     $LINE=~ tr/\t\" //d;
     split(/\s+/,$LINE);
     chop($LINE);
     $LINE =~ tr/ /\"/;
     $content .= $LINE; 
} 
#print $content;
#转换编码
my $characters = decode('utf8', $content);
#my $content = decode('utf8', $content);
open(OUT_FILE,  "output")  || die "can't open UTF-8 encoded filename: $!";
open(TOTAL_FILE,  ">>:encoding(UTF-8)","sort_total")  || die "can't open UTF-8 encoded filename: $!";
#foreach  $char (split(//, $characters)) {
 #syswrite(OUT_FILE,"$char\n");
#}
#统计每个字出现次数
$count=0;
while (my $line=<OUT_FILE>){
	my $line = decode('utf8', $line);
	chomp($line);
        #print $line;
	my $total=0;
	$total = @{[$characters =~ m/\Q$line\E/g]};
	print $total."\n";
	$data->{$line}=$total;
        syswrite(TOTAL_FILE,"$total:$line\n");
	
}





 

