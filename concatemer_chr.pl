#use warnings;
#use strict;

open (IN,"<now.txt") || die ("Error!");
open (SEQ,"<now.fasta") || die ("Error!");
open (OUT,">origin_now.txt") || die ("Error!");

my @table = <IN>;
my @seq = <SEQ>;
my %length;
my %fasta;
my %chr = ('A'=> 0, 'B'=> 0, 'C'=> 0, 'D'=> 0, 'E'=> 0, 'F'=> 0, 'G'=> 0, 'H'=> 0, 'I'=> 0, 'J'=> 0, 'K'=> 0, 
	'L'=> 0, 'M'=> 0, 'N'=> 0, 'O'=> 0, 'P'=> 0, 'Q'=> 0, 'R'=> 0, 'S'=> 0, 'U'=> 0, "V"=> 0);
my %chr_length = ('A'=> 5801, 'B'=> 7898, 'C'=> 7473, 'D'=> 5324, 'E'=> 5697, 'F'=> 7703, 'G'=> 4909, 'H'=> 5802, 'I'=> 5828, 
	'J'=> 6176, 'K'=> 6244, 'L'=> 6617, 'M'=> 6044, 'N'=> 6825, 'O'=> 5843, 'P'=> 6770, 'Q'=> 6163, 'R'=> 6476, 'S'=> 5764, 
	'U'=> 5685, "V"=> 5773);
my $gene;
my $cov;
my %score;
my $point = 0;
my $read = "NA";
my $number = 0;
my $number2 = 0;
my $sum;
my $proportion;
my $orient = 0;
my $stand;
my %compond;

foreach my $a (@seq){
	if ($a =~ />(\S+)/){
		$fasta{$1} = $seq[$number2+1];
		$number2 += 2;
	}
}

print OUT "reads\tA\tB\tC\tD\tE\tF\tG\tH\tI\tJ\tK\tL\tM\tN\tO\tP\tQ\tR\tS\tU\tV\tLength\tCoverage\tNo. of Chr\tSum\tOrient\tChr\n";

foreach my $e (@table){
	if ($e =~ /(\S+)\t\S+\t(\d+)\t(\d+)\t(\S)\t(\S)\t/){
		if ($reads ne $1){
			print OUT $reads;
			foreach my $d (sort {$a cmp $b} (keys(%chr))){
				if ($chr{$d} > 0){
					$number += 1;
					$sum += $chr{$d};
				}
				print OUT "\t",$chr{$d};
			}
			print OUT "\t",length($fasta{$reads}),"\t",$proportion/(length($fasta{$reads})+1),"\t",$number,"\t",$sum,"\t",$orient,"\t",$compond{$reads},"\n";

			$number = 0 ;
			$sum = 0;
			$proportion = 0;
			$orient = 0;
			$stand = "";

			%chr = ('A'=> 0, 'B'=> 0, 'C'=> 0, 'D'=> 0, 'E'=> 0, 'F'=> 0, 'G'=> 0, 'H'=> 0, 'I'=> 0, 'J'=> 0, 'K'=> 0, 
					'L'=> 0, 'M'=> 0, 'N'=> 0, 'O'=> 0, 'P'=> 0, 'Q'=> 0,'R'=> 0, 'S'=> 0, 'U'=> 0, "V"=> 0);
			if ((($3-$2+1)/$chr_length{$5} > 0.8)){
				$compond{$1} .= $5;
				$chr{$5} += ($3-$2+1)/$chr_length{$5};
				$proportion += ($3-$2+1);
				if ($orient < 2){
					if ($stand ne $4) {
						$orient += 1;
						$stand = $4;
					}
				}
			}
			$reads = $1;
		}
		else{
			if ((($3-$2+1)/$chr_length{$5} > 0.8)){
				$compond{$1} .= $5;
				$chr{$5} += ($3-$2+1)/$chr_length{$5};
				$proportion += ($3-$2+1);
				if ($orient < 2){
					if ($stand ne $4) {
						$orient += 1;
						$stand = $4;
					}
				}
			}
		}
	}
}
print OUT $reads;
foreach my $d (sort {$a cmp $b} (keys(%chr))){
	if ($chr{$d} > 0){
		$number += 1;
		$sum += $chr{$d};
	}
	print OUT "\t",$chr{$d};
}
print OUT "\t",length($fasta{$reads}),"\t",$proportion/(length($fasta{$reads})+1),"\t",$number,"\t",$sum,"\t",$orient,"\t",$compond{$reads},"\n";
			
