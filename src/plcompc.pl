#!/usr/bin/perl
use strict;
use Getopt::Long;
use MIME::Base64;
use IO::Socket::INET;

GetOptions(
    "host=s"    => \my $host,
    "port=s"    => \my $port,
    "data=s"    => \my $data
);

$host //= "0.0.0.0";
$port //= "7000"; 
$data //= "ask/have/command:ls";
our $prefix = "/usr/share/plcomp";
our $fname  = __FILE__;

my $client = IO::Socket::INET->new(
    Proto       => "tcp",   # Transfer protokol'ü
    PeerAddr    => $host,   # Sunucu adresi
    PeerPort    => $port    # Sunucu port'u
) or die("Can not establish connection with: $host $port: $!\n");

print($client "$data\n");
my $response = <$client>;
chomp($response);
if (defined($response) and length($response) > 0) {
    my $encoded = decode_base64("$response\n");
    my $modfile = `bash ${prefix}/plcompworker.sh --helper \"${data}\" 3>&-`;
    print("$modfile");
} else {
    print("$fname: Null request!");
    exit(1);
}

close($client);
