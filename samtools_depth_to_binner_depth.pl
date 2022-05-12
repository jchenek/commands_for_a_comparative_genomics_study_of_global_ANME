#!/usr/bin/perl
#usage: perl samtools_depth_to_binner_depth <IN samtools.depth> <OU binner.depth>

my $inp=shift@ARGV;
my $out=shift@ARGV;
open IN,$inp or die;
open OUT,">$out" or die;

my $line=<IN>;
chomp($line);
my @line=split /\t/,$line;
my $id=$line[0];
my $min=$line[1];
my $max=$line[1];
my $num=$line[2];
my $len;
my $dep;
while (<IN>){
	chomp;
	@line=split /\t/,$_;
	if ($line[0] eq $id){
		$max=$line[1];
		$num += $line[2];
	}else{
		$len=$max-$min+1;
		$dep=$num/$len;
		print OUT "$id\t$dep\n";
		$id=$line[0];
		$min=$line[1];
		$max=$line[1];
		$num=$line[2];
	}
}
$len=$max-$min+1;
$dep=$num/$len;
print OUT "$id\t$dep\n";
close IN;
close OUT;
