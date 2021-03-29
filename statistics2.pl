use warnings;
use strict;

open(UNI,"<unique.txt");
open(OUT,">result.txt");

my @unique = <UNI>;
my %pre;
my %after;
my %insertion;
my %deletion;
my %substitution;
my %complex;
my %group;

foreach my $a (@unique){
	if ($a =~ /(\S+)\t(\S+)\t(\d+)/) {
		print $2;
		if ($2 eq "Insertion") {
			$insertion{$1} += 1;
		}
		if ($2 eq "Deletion") {
			$deletion{$1} += 1;
		}
		if ($2 eq "SNV") {
			$substitution{$1} += 1;
		}
		if ($2 eq "Complex") {
			$complex{$1} += 1;
		}
	}
}




foreach my $d (keys %insertion){
	print OUT $d,"\t",$insertion{$d},"\t",$deletion{$d},"\t",$complex{$d},"\t",$substitution{$d},"\n";
}


sub type {
	my $z = $_[0];
	my $y = $_[1];
	if ($z eq "insertion") {$insertion{$y}+=1;}
	if ($z eq "deletion") {$deletion{$y}+=1;}
	if ($z eq "substitution") {$substitution{$y}+=1;}
	if ($z eq "complex") {$complex{$y}+=1;}
}