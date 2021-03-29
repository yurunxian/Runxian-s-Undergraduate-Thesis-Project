#use warnings;
#use strict;

open (IN,"<all.txt") || die "Error!";
open (OUT,">depth_cal_all.txt") || die "Error!";

my @depth = <IN>;

my %sum;
my %num;
my %low;
my %high;

foreach	my $line (@depth){
	if ($line =~ /(\S+)\s(\d+)\s(\d+)\n/){
		if ($3 == 0) {
			$low{$1} += 1;
		}
		if ($3 > 0 and $3 <= 10) {
			$high{$1} += 1;
		}		
		if (exists($sum{$1})){
			$sum{$1} += $3;
			$num{$1} += 1;
		}
		if (!exists($sum{$1})){
			$sum{$1} = $3;
			$num{$1} = 1;
		}
		}
	}

my @key = keys %sum;

foreach my $aver (@key){	
	my $result = $sum{$aver} / $num{$aver};
	my $result2 = $low{$aver} / $num{$aver};
	my $result3 = $high{$aver} / $num{$aver};
		print OUT $aver,"\t",$num{$aver},"\t",$result,"\t",$result2,"\t",$result3,"\n";
}
