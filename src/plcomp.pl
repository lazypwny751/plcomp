#!/usr/bin/perl

=pod
    Perl Communication Protocol - plcomp
    Copyright (C) 2023  lazypwny751

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
=cut

# Perl communication protocol as also known configuration and util protocol
# at text layer protocol which uses TCP.

use strict;
use Switch;
use Getopt::Long;
use MIME::Base64;
use IO::Socket::INET;

GetOptions(
    "port=s"    => \my $port,
    "listen=s"  => \my $listen
);

$port       //= "7000";
$listen     //= "5";
our $prefix = "/usr/share/plcomp";

my $server = IO::Socket::INET->new(
    Proto       => "tcp",
    LocalPort   => $port,
    Listen      => $listen,
    Reuse       => 1
) or die("Could not starting the server: $!\n");

print("The server running at 0.0.0.0:$port..\n");

while (1) {
    # Accepting the request.
    my $client = $server->accept();
    my $request = <$client>;
    chomp($request);
    print("Request accepted: $request.\n");

    # my $response = (split/\s+/,$request)[0];
    # ==RULE SIDE==
    if (defined($request) and length($request) > 0) {
        our $response = encode_base64(`bash ${prefix}/plcompworker.sh --worker \"${request}\" 3>&-`);
    } else {
        our $response = "false";
    }
    # === ***** ===
    our $response //= "false";

    print("Server reply: ${response}");
    
    my @ln = split(/\n/, $response);
    foreach my $l (@ln) {
        print($client "${l}");
    }

    # Close the connection
    close($client);
}