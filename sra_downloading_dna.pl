#!usr/bin/perl
#perl .pl <IN list of sra id>
#select target sra in ncbi, click 'send to', click 'file', click 'RunInfo'; can get all info easily.
#if you want to select all, then select nothing
#"fastq-dump" version 2.11.0
use warnings;
use strict;

print "conda activate cjw\n";
open IN, "$ARGV[0]";
open OU, ">sra_download_com";
while(<IN>){
	chomp;
	s/\r//;
	print "fastq-dump --gzip --defline-qual '+' --defline-seq '\@\$ac_\$si \$ri' --split-e $_ -O fastq/\n";
	print OU "fastq-dump --gzip --defline-qual '+' --defline-seq '\@\$ac_\$si \$ri' --split-e $_ -O fastq/\n";
	}
print "ls\n";
print "#############OR#############\n";
print "conda activate cjw\n";
print "ParaFly -c sra_download_com -CPU 4\n";

close IN;