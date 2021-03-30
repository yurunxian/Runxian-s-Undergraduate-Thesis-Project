use warnings;
#use strict;

open(POS,"<position.txt");
open(UNI,"<unique.txt");
open(FEA,"<feature.txt");
open(OUT,">result.txt");
open(OU,">result2.txt");

my @position = <POS>;
my @unique = <UNI>;
my @feature = <FEA>;
my %pre;
my %after;
my %insertion;
my %deletion;
my %substitution;
my %complex;
my %group;

foreach my $a (@position){
	if ($a =~/(\S)\t(\d+)\t(\d+)\t(\d+)\t(\d+)\t(\d+)\t(\d+)/) {
		$pre{$1} = 460+$5+$6;
		$after{$1} = $2+$3+460+$5+$6+$7;
	}
}

foreach my $a (@feature){
	if ($a =~ /(\S)\t(\S)\t(\d+)\t(\d+)\t(\S+)/) {
		$insertion{$5} = 0;
		$deletion{$5} = 0;
		$substitution{$5} = 0;
		$complex{$5} = 0;		
	}
}


foreach my $a (@unique){
	if ($a =~/(\S)\t(\d+)\t(\S+)\t(\d+)/){
		chomp($a);
		if ($1 eq "A") {
			if ($2<787) {print OU $a,"\t","SC1-nad4","\n"; type($3,"SC1-nad4");}
			if ($2>4852) {print OU $a,"\t","nad4-SC2","\n"; type($3,"nad4-SC2");}
			if ($2>=787 and $2<=875) {print OU $a,"\t","nad4_exon4","\n"; type($3,"nad4_exon4");}
			if ($2>=876 and $2<=1669) {print OU $a,"\t","nad4_intron3","\n"; type($3,"nad4_intron3");}
			if ($2>=1670 and $2<=2092) {print OU $a,"\t","nad4_exon3","\n"; type($3,"nad4_exon3");}
			if ($2>=2093 and $2<=3018) {print OU $a,"\t","nad4_intron2","\n"; type($3,"nad4_intron2");}
			if ($2>=3019 and $2<=3533) {print OU $a,"\t","nad4_exon2","\n"; type($3,"nad4_exon2");}
			if ($2>=3534 and $2<=4391) {print OU $a,"\t","nad4_intron1","\n"; type($3,"nad4_intron1");}
			if ($2>=4392 and $2<=4852) {print OU $a,"\t","nad4_exon1","\n"; type($3,"nad4_exon1");}
		}	
		if ($1 eq "B") {
			if ($2<1218) {print OU $a,"\t","SC2-nad2_exon3","\n"; type($3,"SC2-nad2_exon3");}
			if ($2>=1218 and $2<=1378) {print OU $a,"\t","nad2_exon3","\n"; type($3,"nad2_exon3");}
			if ($2>=1379 and $2<=2523) {print OU $a,"\t","nad2_intron3","\n"; type($3,"nad2_intron3");}
			if ($2>=2524 and $2<=3096) {print OU $a,"\t","nad2_exon4","\n"; type($3,"nad2_exon4");}
			if ($2>=3097 and $2<=3966) {print OU $a,"\t","nad2_intron4","\n"; type($3,"nad2_intron4");}
			if ($2>=3967 and $2<=4154) {print OU $a,"\t","nad2_exon5","\n"; type($3,"nad2_exon5");}
			if ($2>=4155 and $2<=4943) {print OU $a,"\t","nad2_exon5-atp6","\n"; type($3,"nad2_exon5-atp6");}
			if ($2>=4944 and $2<=5738) {print OU $a,"\t","atp6","\n"; type($3,"atp6");}
			if ($2>5738) {print OU $a,"\t","atp6-SC1","\n"; type($3,"atp6-SC1");}
		}
		if ($1 eq "C") {
			if ($2<882) {print OU $a,"\t","SC2-rrn26","\n"; type($3,"SC2-rrn26");}
			if ($2>=882 and $2<=3895) {print OU $a,"\t","rrn26","\n"; type($3,"rrn26");}
			if ($2>=3896 and $2<=4496) {print OU $a,"\t","rrn26-cox2","\n"; type($3,"rrn26-cox2");}
			if ($2>=4497 and $2<=4579) {print OU $a,"\t","cox2_exon3","\n"; type($3,"cox2_exon3");}
			if ($2>=4580 and $2<=5256) {print OU $a,"\t","cox2_intron2","\n"; type($3,"cox2_intron2");}
			if ($2>=5257 and $2<=5568) {print OU $a,"\t","cox2_exon2","\n"; type($3,"cox2_exon2");}
			if ($2>=5569 and $2<=6159) {print OU $a,"\t","cox2_intron1","\n"; type($3,"cox2_intron1");}
			if ($2>=6160 and $2<=6537) {print OU $a,"\t","cox2_exon1","\n"; type($3,"cox2_exon1");}
			if ($2>6537) {print OU $a,"\t","cox2-SC1","\n"; type($3,"cox2-SC1");}
		}
		if ($1 eq "D") {
			if ($2<1102) {print OU $a,"\t","SC1-rrn5","\n"; type($3,"SC1-rrn5");}
			if ($2>=1102 and $2<=1222) {print OU $a,"\t","rrn5","\n"; type($3,"rrn5");}
			if ($2>=1223 and $2<=1283) {print OU $a,"\t","rrn5-rrn18","\n"; type($3,"rrn5-rrn18");}
			if ($2>=1284 and $2<=2917) {print OU $a,"\t","rrn18","\n"; type($3,"rrn18");}
			if ($2>=2918 and $2<=3538) {print OU $a,"\t","rrn18-ccmC","\n"; type($3,"rrn18-ccmC");}
			if ($2>=3539 and $2<=4234) {print OU $a,"\t","ccmC","\n"; type($3,"ccmC");}
			if ($2>4234) {print OU $a,"\t","ccmC-SC1","\n"; type($3,"ccmC-SC1");}
		}
		if ($1 eq "E") {
			if ($2<1674) {print OU $a,"\t","SC2-cox1_fragment","\n"; type($3,"SC2-cox1_fragment");}
			if ($2>=1674 and $2<=1840) {print OU $a,"\t","cox1_fragment","\n"; type($3,"cox1_fragment");}
			if ($2>=1841 and $2<=1848) {print OU $a,"\t","cox1_fragment-rps10","\n"; type($3,"cox1_fragment-rps10");}
			if ($2>=1849 and $2<=1957) {print OU $a,"\t","rps10_exon2","\n"; type($3,"rps10_exon2");}
			if ($2>=1958 and $2<=2534) {print OU $a,"\t","rps10_intron1","\n"; type($3,"rps10_intron1");}
			if ($2>=2535 and $2<=2761) {print OU $a,"\t","rps10_exon1","\n"; type($3,"rps10_exon1");}
			if ($2>=2762 and $2<=2920) {print OU $a,"\t","rps10-ccmFN","\n"; type($3,"rps10-ccmFN");}
			if ($2>=2921 and $2<=4568) {print OU $a,"\t","ccmFN","\n"; type($3,"ccmFN");}
			if ($2>4568) {print OU $a,"\t","ccmFN-SC1","\n"; type($3,"ccmFN-SC1");}
		}
		if ($1 eq "F") {
			if ($2<1858) {print OU $a,"\t","SC2-nad5_exon2","\n"; type($3,"SC2-nad5_exon2");}
			if ($2>=1858 and $2<=3078) {print OU $a,"\t","nad5_exon2","\n"; type($3,"nad5_exon2");}
			if ($2>=3079 and $2<=3691) {print OU $a,"\t","nad5_intron1","\n"; type($3,"nad5_intron1");}
			if ($2>=3692 and $2<=3921) {print OU $a,"\t","nad5_exon1","\n"; type($3,"nad5_exon1");}
			if ($2>=3922 and $2<=4016) {print OU $a,"\t","nad5_exon1-atp9","\n"; type($3,"nad5_exon1-atp9");}
			if ($2>=4017 and $2<=4246) {print OU $a,"\t","atp9","\n"; type($3,"atp9");}
			if ($2>=4247 and $2<=4473) {print OU $a,"\t","atp9-atp1","\n"; type($3,"atp9-atp1");}
			if ($2>=4474 and $2<=5960) {print OU $a,"\t","atp1","\n"; type($3,"atp1");}
			if ($2>5960) {print OU $a,"\t","atp1-SC1","\n"; type($3,"atp1-SC1");}
		}
		if ($1 eq "G") {
			if ($2<1330) {print OU $a,"\t","SC2-cob","\n"; type($3,"SC2-cob");}
			if ($2>=1330 and $2<=2515) {print OU $a,"\t","cob","\n"; type($3,"cob");}
			if ($2>=2516 and $2<=2671) {print OU $a,"\t","cob-rps12","\n"; type($3,"cob-rps12");}
			if ($2>=2672 and $2<=3058) {print OU $a,"\t","rps12","\n"; type($3,"rps12");}
			if ($2>=3059 and $2<=3106) {print OU $a,"\t","rps12-nad3","\n"; type($3,"rps12-nad3");}
			if ($2>=3107 and $2<=3535) {print OU $a,"\t","nad3","\n"; type($3,"nad3");}
			if ($2>=3536 and $2<=3580) {print OU $a,"\t","nad3-nad9","\n"; type($3,"nad3-nad9");}
			if ($2>=3581 and $2<=4140) {print OU $a,"\t","nad9","\n"; type($3,"nad9");}
			if ($2>4140) {print OU $a,"\t","nad9-SC1","\n"; type($3,"nad9-SC1");}
		}
		if ($1 eq "H") {
			if ($2<942) {print OU $a,"\t","SC2-cox1","\n"; type($3,"SC2-cox1");}
			if ($2>=942 and $2<=1795) {print OU $a,"\t","cox1_exon2","\n"; type($3,"cox1_exon2");}
			if ($2>=1796 and $2<=2760) {print OU $a,"\t","cox1_intron1","\n"; type($3,"cox1_intron1");}
			if ($2>=2761 and $2<=3550) {print OU $a,"\t","cox1_exon1","\n"; type($3,"cox1_exon1");}
			if ($2>=3551 and $2<=3765) {print OU $a,"\t","cox1-ccmB","\n"; type($3,"cox1-ccmB");}
			if ($2>=3766 and $2<=4373) {print OU $a,"\t","ccmB","\n"; type($3,"ccmB");}
			if ($2>=4374 and $2<=4626) {print OU $a,"\t","ccmB-nad1_exon5","\n"; type($3,"ccmB-nad1_exon5");}
			if ($2>=4627 and $2<=4878) {print OU $a,"\t","nad1_exon5","\n"; type($3,"nad1_exon5");}
			if ($2>4878) {print OU $a,"\t","nad1_exon5-SC1","\n"; type($3,"nad1_exon5-SC1");}
		}
		if ($1 eq "I") {
			if ($2<1574) {print OU $a,"\t","SC2-nad2_exon2","\n"; type($3,"SC2-nad2_exon2");}
			if ($2>=1574 and $2<=1965) {print OU $a,"\t","nad2_exon2","\n"; type($3,"nad2_exon2");}
			if ($2>=1966 and $2<=2543) {print OU $a,"\t","nad2_intron1","\n"; type($3,"nad2_intron1");}
			if ($2>=2544 and $2<=2699) {print OU $a,"\t","nad2_exon1","\n"; type($3,"nad2_exon1");}
			if ($2>=2698 and $2<=3206) {print OU $a,"\t","nad2_exon1-nad6","\n"; type($3,"nad2_exon1-nad6");}
			if ($2>=3207 and $2<=3716) {print OU $a,"\t","nad6","\n"; type($3,"nad6");}
			if ($2>=3715 and $2<=3901) {print OU $a,"\t","nad6-sdh4","\n"; type($3,"nad6-sdh4");}
			if ($2>=3902 and $2<=4255) {print OU $a,"\t","sdh4","\n"; type($3,"sdh4");}
			if ($2>=4186 and $2<=4973) {print OU $a,"\t","cox3","\n"; type($3,"cox3");}
			if ($2>4973) {print OU $a,"\t","cox3-SC1","\n"; type($3,"cox3-SC1");}
		}
		if ($1 eq "J") {
			if ($2<1674) {print OU $a,"\t","SC2-cox1_fragment","\n"; type($3,"SC2-cox1_fragment");}
			if ($2>=1674 and $2<=1840) {print OU $a,"\t","cox1_fragment","\n"; type($3,"cox1_fragment");}
			if ($2>=1841 and $2<=1851) {print OU $a,"\t","cox1_fragment-rps10","\n"; type($3,"cox1_fragment-rps10");}
			if ($2>=1852 and $2<=1960) {print OU $a,"\t","rps10_exon2","\n"; type($3,"rps10_exon2");}
			if ($2>=1961 and $2<=2533) {print OU $a,"\t","rps10_intron1","\n"; type($3,"rps10_intron1");}
			if ($2>=2534 and $2<=2760) {print OU $a,"\t","rps10_exon1","\n"; type($3,"rps10_exon1");}
			if ($2>=2761 and $2<=2919) {print OU $a,"\t","rps10-ccmFN_fragment","\n"; type($3,"rps10-ccmFN_fragment");}
			if ($2>=2920 and $2<=3325) {print OU $a,"\t","ccmFN_fragment","\n"; type($3,"ccmFN_fragment");}
			if ($2>=3326 and $2<=3545) {print OU $a,"\t","ccmFN_fragment-nad6","\n"; type($3,"ccmFN_fragment-nad6");}
			if ($2>=3546 and $2<=4069) {print OU $a,"\t","nad6","\n"; type($3,"nad6");}
			if ($2>=4068 and $2<=5023) {print OU $a,"\t","nad6-nad4L","\n"; type($3,"nad6-nad4L");}
			if ($2>=5024 and $2<=5327) {print OU $a,"\t","nad4L","\n"; type($3,"nad4L");}
			if ($2>5327) {print OU $a,"\t","nad4L-SC1","\n"; type($3,"nad4L-SC1");}
		}
		if ($1 eq "K") {
			if ($2<925) {print OU $a,"\t","SC2-nad7","\n"; type($3,"SC2-nad7");}
			if ($2>=925 and $2<=1060) {print OU $a,"\t","nad7_exon1","\n"; type($3,"nad7_exon1");}
			if ($2>=1061 and $2<=1732) {print OU $a,"\t","nad7_intron1","\n"; type($3,"nad7_intron1");}
			if ($2>=1733 and $2<=1801) {print OU $a,"\t","nad7_exon2","\n"; type($3,"nad7_exon2");}
			if ($2>=1802 and $2<=2565) {print OU $a,"\t","nad7_intron2","\n"; type($3,"nad7_intron2");}
			if ($2>=2566 and $2<=3032) {print OU $a,"\t","nad7_exon3","\n"; type($3,"nad7_exon3");}
			if ($2>=3033 and $2<=3781) {print OU $a,"\t","nad7_intron3","\n"; type($3,"nad7_intron3");}
			if ($2>=3782 and $2<=4023) {print OU $a,"\t","nad7_exon4","\n"; type($3,"nad7_exon4");}
			if ($2>=4024 and $2<=5064) {print OU $a,"\t","nad7_intron4","\n"; type($3,"nad7_intron4");}
			if ($2>=5065 and $2<=5333) {print OU $a,"\t","nad7_exon5","\n"; type($3,"nad7_exon5");}
			if ($2>5333) {print OU $a,"\t","nad7-SC1","\n"; type($3,"nad7-SC1");}
		}
		if ($1 eq "L") {
			if ($2<1106) {print OU $a,"\t","SC2-nad5_exon5","\n"; type($3,"SC2-nad5_exon5");}
			if ($2>=1106 and $2<=1261) {print OU $a,"\t","nad5_exon5","\n"; type($3,"nad5_exon5");}
			if ($2>=1262 and $2<=1954) {print OU $a,"\t","nad5_intron4","\n"; type($3,"nad5_intron4");}
			if ($2>=1955 and $2<=2340) {print OU $a,"\t","nad5_exon4","\n"; type($3,"nad5_exon4");}
			if ($2>=2241 and $2<=2947) {print OU $a,"\t","nad5_exon4-rpl16","\n"; type($3,"nad5_exon4-rpl16");}
			if ($2>=2948 and $2<=3356) {print OU $a,"\t","rpl16","\n"; type($3,"rpl16");}
			if ($2>=3353 and $2<=4715) {print OU $a,"\t","rps3_exon2","\n"; type($3,"rps3_exon2");}
			if ($2>=4716 and $2<=5506) {print OU $a,"\t","rps3_intron1","\n"; type($3,"rps3_intron1");}
			if ($2>=5507 and $2<=5580) {print OU $a,"\t","rps3_exon1","\n"; type($3,"rps3_exon1");}
			if ($2>=5581 and $2<=5590) {print OU $a,"\t","rps3-rps19","\n"; type($3,"rps3-rps19");}
			if ($2>=5591 and $2<=5862) {print OU $a,"\t","rps19","\n"; type($3,"rps19");}
			if ($2>5862) {print OU $a,"\t","rps19-SC1","\n"; type($3,"rps19-SC1");}
		}
		if ($1 eq "M") {
			if ($2<1089) {print OU $a,"\t","SC2-ccmFC","\n"; type($3,"SC2-ccmFC");}
			if ($2>=1089 and $2<=1572) {print OU $a,"\t","ccmFC_exon2","\n"; type($3,"ccmFC_exon2");}
			if ($2>=1573 and $2<=2229) {print OU $a,"\t","ccmFC_intron1","\n"; type($3,"ccmFC_intron1");}
			if ($2>=2230 and $2<=2855) {print OU $a,"\t","ccmFC_exon1","\n"; type($3,"ccmFC_exon1");}
			if ($2>=2286 and $2<=4145) {print OU $a,"\t","ccmFC-atp8","\n"; type($3,"ccmFC-atp8");}
			if ($2>=4146 and $2<=4616) {print OU $a,"\t","atp8","\n"; type($3,"atp8");}
			if ($2>=4617 and $2<=4872) {print OU $a,"\t","atp8-sdh3","\n"; type($3,"atp8-sdh3");}
			if ($2>=4873 and $2<=5159) {print OU $a,"\t","sdh3","\n"; type($3,"sdh3");}
			if ($2>5159) {print OU $a,"\t","sdh3-SC1","\n"; type($3,"sdh3-SC1");}
		}
		if ($1 eq "N") {
			if ($2<1282) {print OU $a,"\t","SC2-rpl5","\n"; type($3,"SC2-rpl5");}
			if ($2>=1282 and $2<=1783) {print OU $a,"\t","rpl5","\n"; type($3,"rpl5");}
			if ($2>=1784 and $2<=3500) {print OU $a,"\t","rpl5-atp4","\n"; type($3,"rpl5-atp4");}
			if ($2>=3501 and $2<=4024) {print OU $a,"\t","atp4","\n"; type($3,"atp4");}
			if ($2>=4025 and $2<=4557) {print OU $a,"\t","atp4-rpl2","\n"; type($3,"atp4-rpl2");}
			if ($2>=4558 and $2<=4618) {print OU $a,"\t","rpl2_exon2","\n"; type($3,"rpl2_exon2");}
			if ($2>=4619 and $2<=5305) {print OU $a,"\t","rpl2_intron1","\n"; type($3,"rpl2_intron1");}
			if ($2>=5306 and $2<=6020) {print OU $a,"\t","rpl2_exon1","\n"; type($3,"rpl2_exon1");}
			if ($2>6020) {print OU $a,"\t","rpl2-SC1","\n"; type($3,"rpl2-SC1");}
		}
		if ($1 eq "O") {
			if ($2<1741) {print OU $a,"\t","SC2-nad1_exon3","\n"; type($3,"SC2-nad1_exon3");}
			if ($2>=1741 and $2<=1924) {print OU $a,"\t","nad1_exon3","\n"; type($3,"nad1_exon3");}
			if ($2>=1925 and $2<=2616) {print OU $a,"\t","nad1_intron2","\n"; type($3,"nad1_intron2");}
			if ($2>=2617 and $2<=2699) {print OU $a,"\t","nad1_exon2","\n"; type($3,"nad1_exon2");}
			if ($2>=2670 and $2<=3014) {print OU $a,"\t","nad1_exon2-matR_fragment","\n"; type($3,"nad1_exon2-matR_fragment");}
			if ($2>=3015 and $2<=3806) {print OU $a,"\t","matR_fragment","\n"; type($3,"matR_fragment");}
			if ($2>=3807 and $2<=3851) {print OU $a,"\t","matR_fragment-rps4","\n"; type($3,"matR_fragment-rps4");}
			if ($2>=3852 and $2<=4895) {print OU $a,"\t","rps4","\n"; type($3,"rps4");}
			if ($24895) {print OU $a,"\t","rps4-SC1","\n"; type($3,"rps4-SC1");}
		}
		if ($1 eq "P") {
			if ($2<2502) {print OU $a,"\t","SC2-nad5_exon3","\n"; type($3,"SC2-nad5_exon3");}
			if ($2>=2502 and $2<=2523) {print OU $a,"\t","nad5_exon3","\n"; type($3,"nad5_exon3");}
			if ($2>2523) {print OU $a,"\t","nad5_exon3-SC1","\n"; type($3,"nad5_exon3-SC1");}
		}
		if ($1 eq "Q") {
			if ($2<2574) {print OU $a,"\t","SC2-matR-fragment","\n"; type($3,"SC2-matR-fragment");}
			if ($2>=2574 and $2<=4054) {print OU $a,"\t","matR_fragment","\n"; type($3,"matR_fragment");}
			if ($2>=4055 and $2<=4547) {print OU $a,"\t","matR_fragment-nad1_exon4","\n"; type($3,"matR_fragment-nad1_exon4");}
			if ($2>=4548 and $2<=4606) {print OU $a,"\t","nad1_exon4","\n"; type($3,"nad1_exon4");}
			if ($2>=4607 and $2<=4864) {print OU $a,"\t","nad1_exon4-rps1","\n"; type($3,"nad1_exon4-rps1");}
			if ($2>=4865 and $2<=5395) {print OU $a,"\t","rps1","\n"; type($3,"rps1");}
			if ($2>5395) {print OU $a,"\t","rps1-SC1","\n"; type($3,"rps1-SC1");}
		}
		if ($1 eq "R") {
			if ($2<873) {print OU $a,"\t","SC2-rpl10","\n"; type($3,"SC2-rpl10");}
			if ($2>=873 and $2<=1268) {print OU $a,"\t","rpl10","\n"; type($3,"rpl10");}
			if ($2>1268) {print OU $a,"\t","rps10-SC1","\n"; type($3,"rps10-SC1");}
		}
		if ($1 eq "S") {
			print OU $a,"\t","S","\n"; type($3,"S");
		}
		if ($1 eq "U") {
			if ($2<3556) {print OU $a,"\t","SC2-nad1_exon1","\n"; type($3,"SC2-nad1_exon1");}
			if ($2>=3556 and $2<=3934) {print OU $a,"\t","nad1_exon1","\n"; type($3,"nad1_exon1");}
			if ($2>=3935 and $2<=4168) {print OU $a,"\t","nad1_exon1-mttB","\n"; type($3,"nad1_exon1-mttB");}
			if ($2>=4169 and $2<=4888) {print OU $a,"\t","mttB","\n"; type($3,"mttB");}
			if ($2>4888) {print OU $a,"\t","mttB-SC1","\n"; type($3,"mttB-SC1");}
		}
		if ($1 eq "V") {
			print OU $a,"\t","V","\n"; type($3,"V");
		}
	}
}

foreach my $d (@feature){
	if ($d =~ /(\S)\t(\S)\t(\d+)\t(\d+)\t(\S+)/){
		print OUT $1,"\t",$5,"\t",$insertion{$5},"\t",$deletion{$5},"\t",$substitution{$5},"\t",$complex{$5},"\n";
	}
}


sub type {
	my $z = $_[0];
	my $y = $_[1];
	if ($z eq "insertion") {$insertion{$y}+=1;}
	if ($z eq "deletion") {$deletion{$y}+=1;}
	if ($z eq "substitution") {$substitution{$y}+=1;}
	if ($z eq "complex") {$complex{$y}+=1;}
}