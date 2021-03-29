

open (IN,"<RNA_editing2.txt") or die ("Error!");
open (SEQ,"<DPSG_CDS.fasta") or die ("Error!");
open (OUT,">result2.txt");

my @table = <IN>;
my @seq = <SEQ>;
my %fasta;
my $number = 0;
my %code = ('TTT'=>'Phe','TTC'=>'Phe','TTA'=>'Leu','TTG'=>'Leu','CTT'=>'Leu','CTC'=>'Leu','CTA'=>'Leu','CTG'=>'Leu','ATT'=>'Ile',
	'ATC'=>'Ile','ATA'=>'Ile','ATG'=>'Met','GTT'=>'Val','GTC'=>'Val','GTA'=>'Val','GTG'=>'Val','TCT'=>'Ser','TCC'=>'Ser',
	'TCA'=>'Ser','TCG'=>'Ser','CCT'=>'Pro','CCC'=>'Pro','CCA'=>'Pro','CCG'=>'Pro','ACT'=>'Thr','ACC'=>'Thr','ACA'=>'Thr',
	'ACG'=>'Thr','GCT'=>'Ala','GCC'=>'Ala','GCA'=>'Ala','GCG'=>'Ala','TAT'=>'Tyr','TAC'=>'Tyr','TAA'=>'Stop','TAG'=>'Stop',
	'CAT'=>'His','CAC'=>'His','CAA'=>'Gln','CAG'=>'Gln','AAT'=>'Asn','AAC'=>'Asn','AAA'=>'Lys','AAG'=>'Lys','GAT'=>'Asp',
	'GAC'=>'Asp','GAA'=>'Glu','GAG'=>'Glu','TGT'=>'Cys','TGC'=>'Cys','TGA'=>'Stop','TGG'=>'Trp','CGT'=>'Arg','CGC'=>'Arg',
	'CGA'=>'Arg','CGG'=>'Arg','AGT'=>'Ser','AGC'=>'Ser','AGA'=>'Arg','AGG'=>'Arg','GGT'=>'Gly','GGC'=>'Gly','GGA'=>'Gly','GGG'=>'Gly');
my $tmp;
my $before;
my $after;

foreach my $a (@seq){
	if ($a =~ />(\S+)/){
		$fasta{$1} = $seq[$number+1];
		$number += 2;
	}
}

foreach my $a (@table){
	chomp($a);
	if ($a =~ /(\S+)\t(\d+)\t\S+\t\S+\t\S+/){
		print $1,"\t",$2,"\n";
		if ($2 % 3 == 1) {
			$tmp = substr($fasta{$1},$2-1,3);
			$before = $code{$tmp};
			substr($fasta{$1},$2-1,2) = "TT";
			$tmp = substr($fasta{$1},$2-1,3);
			$after = $code{$tmp};
		}
		if ($2 % 3 == 2) {
			$tmp = substr($fasta{$1},$2-2,3);
			$before = $code{$tmp};
			substr($fasta{$1},$2-1,2) = "TT";
			$tmp = substr($fasta{$1},$2-2,3);
			$after = $code{$tmp};
		}
		if ($2 % 3 == 0) {
			$tmp = substr($fasta{$1},$2-3,3);
			$before = $code{$tmp};
			substr($fasta{$1},$2-1,2) = "TT";
			$tmp = substr($fasta{$1},$2-3,3);
			$after = $code{$tmp};
		}
		if ($before eq $after){
			print OUT $a,"\t",$before,"\t",$after,"\t","syn","\n";
		}
		if ($before ne $after){
			print OUT $a,"\t",$before,"\t",$after,"\t","nonsyn","\n";
		}
	}
}