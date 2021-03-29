use strict;
use warnings;

open (IN,"<table.txt") || die ("Error!");
open (SEQ,"<DPSG_main.fasta") || die ("Error!");
open (OUT,">DPSG_recombination_ref2.fas") || die ("Error!");

my @seq = <SEQ>;
my @table = <IN>;
my @left;
my @right;
my %fasta;
my $number = 0;
my $temp;
my $core;
my $head;
my $flanking_length = 500;

foreach my $a (@seq){
	if ($a =~ />(\S+)\n/){
		$fasta{$1} = $seq[$number+1];
		$number += 2;
	}
}

my $stable = "1";
$number = 0;
foreach my $b (@table){
	if ($b =~ /(\S+)\t\d+\t(\d+)\t(\d+)\t\S+\t(\S)/){
		if ($1 eq $stable){
			if ($2 < $3){
				$number += 1;
				$left[$number] = substr($fasta{$4},$2-$flanking_length-1,$flanking_length);
				$right[$number] = substr($fasta{$4},$3,$flanking_length);
				$core = substr($fasta{$4},$2-1,$3-$2+1);
				#print OUT $1,"_",$number,"\n",$left[$number],"\n",$right[$number],"\n";
			}
			if ($2 > $3){
				$number += 1;
				$temp = substr($fasta{$4},$3-$flanking_length-1,$flanking_length);
				$right[$number] = revcom($temp);
				$temp = substr($fasta{$4},$2,$flanking_length);
				$left[$number] = revcom($temp);
				$temp = substr($fasta{$4},$3-1,$2-$3+1);
				$core = revcom($temp);
			}
		}
		if ($1 ne $stable){
			my $order = 0;
			foreach my $c (@left) {
				foreach my $d (@right) {
					print OUT ">",$stable,"_",$order,"\n",$c,$core,$d,"\n";
					$order += 1;
				}
			}
			@left = ();
			@right = ();
			$stable = $1;
			$number = 0;
			$core = "";
			if ($2 < $3){
				$left[$number] = substr($fasta{$4},$2-$flanking_length-1,$flanking_length);
				$right[$number] = substr($fasta{$4},$3,$flanking_length);
				$core = substr($fasta{$4},$2-1,$3-$2+1);
				#print OUT $1,"_",$number,"\n",$left[$number],"\n",$right[$number],"\n";
			}
			if ($2 > $3){
				$temp = substr($fasta{$4},$3-$flanking_length-1,$flanking_length);
				$left[$number] = revcom($temp);
				$temp = substr($fasta{$4},$2,$flanking_length);
				$right[$number] = revcom($temp);
				$temp = substr($fasta{$4},$2-1,$3-$2+1);
				$core = revcom($temp);
			}
		}
	
	}
}
			my $order = 0;
			foreach my $c (@left) {
				foreach my $d (@right) {
					print OUT ">",$stable,"_",$order,"\n",$c,$core,$d,"\n";
					$order += 1;
				}
			}

sub revcom
{
	my($dna)=@_;
	my ($revcom)=reverse($dna);
	$revcom=~tr/ACGTacgt/TGCAtgca/;
	return $revcom;
}