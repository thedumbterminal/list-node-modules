use strict;
use warnings;
use Data::Dumper;

my $deps = ();

my @dirs;

push(@dirs, @{findDirs('.')});

while(my $dir = shift(@dirs)){
	my $json = readPackage($dir);
	my $name = getName($json);
	my $version = getVersion($json);
	
	if(!$deps->{$name}){
		$deps->{$name} = [];
	}
	
	unless ( $version ~~ $deps->{$name} ) {
		push($deps->{$name}, $version);
	}
	
	push(@dirs, @{findDirs($dir)});
}

print Dumper $deps;

sub findDirs{
	my $startPath = shift;
	$startPath .= '/node_modules';
	opendir(my $dh, $startPath) || return [];
	my @dirs = grep { !/^\./ && -d "$startPath/$_" } readdir($dh);
	closedir $dh;
	my @prefixed = map { "$startPath/$_" } @dirs;
	return \@prefixed;
}

sub readPackage{
	my $path = shift;
	$path .= '/package.json';
	open(my $pj, '<', $path) || die;
	my $contents = "";
	while(my $line = <$pj>){
		$contents .= $line;
	}
	close $pj;
	return $contents;
}

sub getName{
	my $contents = shift;
	if($contents =~ m/\"name\"\: \"([^\"]+)\"/){
		return $1;		
	}
	else{
		die 'could not find name';
	}
}

sub getVersion{
	my $contents = shift;
	if($contents =~ m/\"version\"\: \"([^\"]+)\"/){
		return $1;		
	}
	else{
		die 'could not find version';
	}
}