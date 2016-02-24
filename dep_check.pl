#!/usr/bin/env perl
use strict;
use warnings;

die "Usage: $0 <project dir>\n" unless $ARGV[0];

my $deps = getDeps($ARGV[0]);
outputDeps($deps);

sub getDeps{
	chdir(shift);
	open(my $listHandle, '-|', 'npm ll --parseable') or die "Can't get dependancies: $!\n";
	my $depHash = ();
	while(my($name, $version) = <$listHandle> =~ m/\:([^\@]+)\@([^\:]+)\:/){
		$depHash->{$name} ||= [];
		push($depHash->{$name}, $version);
	}
	close($listHandle);
	$depHash;
}

sub outputDeps{
	foreach my $name (sort keys(shift)){
		printf("%-30s %s\n", $name, join(', ', sort @{$deps->{$name}}));
	}
}