use warnings;
use strict;

open (READS,"<filted_reads2.fas") or die("No!");
open (BLAST,"<filted.txt") or die("No!");
#open (OUT,">split.txt") or die("No!");

my @seq2 = <READS>;
my %reads;
my @blast = <BLAST>;
my $head;
my %split;
my $query_name = "a";
my $gene;
my $number = 0;

$number = 0;
foreach my $a (@seq2){
	if ($a =~ />(\S+)/){
		$reads{$1} = $seq2[$number+1];
		$number += 2;
	}
}

$number = 1;
foreach my $a (@blast){
	if ($a =~ /(\S+)\t\d+\t(\d+)\t(\d+)\t(\S)\t(\S)\t(\d+)\t(\d+)\t(\d+)/) {
		if ( ($8-$7) > 0.8*$6 ) {
			if ($query_name ne $1){
				$query_name = $1;
				$number = 1;
				$head = $5."-".$1."-".$number;
				$split{$head} = split_trans($1,$2,$3,$4);
				$number += 1;
			}
			else{
				$head = $5."-".$1."-".$number;
				$split{$head} = split_trans($1,$2,$3,$4);
				$number += 1;
			}
		}
	}
}

foreach my $c (sort {$a cmp $b} (keys(%split))){
	if ($c =~ /(\S+)\-\S+\-\S+/) {
		open OUT,">>$1.fas" or print ("?");
		print OUT ">",$c,"\n",$split{$c},"\n";
	}
}

sub split_trans {
	my $name = $_[0];
	my $pos1 = $_[1];
	my $pos2 = $_[2];
	my $orient = $_[3];
	my $out;
	if ($orient eq "+") {
		$out = substr($reads{$name},$pos1-1,$pos2-$pos1+1);
	}
	else{
		$out = substr($reads{$name},$pos1-1,$pos2-$pos1+1);
		$out = reverse $out;
		$out =~ tr/ATCG/TAGC/;
	}
	return $out;
}