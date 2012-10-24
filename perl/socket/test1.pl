#!/usr/bin/perl

use Socket;

$docroot = "/home/hal/public_html"; 
$this_host = "my-server.netmarket.com"; 
$port = 80; 
$user = "nobody";

# Let children perish 
# 
$SIG{"CHLD"} = "IGNORE";

# Get userid for $user. Abort if userid is zero (superuser) or 
# non-existent.
# 
unless ($uid = (getpwnam($user))[2]) { 
	die "Attempt to run server as non-existent or superuser\n"; }

# Initialize C structure 
# 
$server_addr = (gethostbyname($this_host))[4]; 
$server_struct = pack("S n a4 x8", AF_INET, $port, 
				$server_addr);

# Set up socket 
# 
$proto = (getprotobyname("tcp"))[2]; 
socket(SOCK, PF_INET, SOCK_STREAM, $proto) || 
	die "Failed to initialize socket: $!\n";

# Bind to address/port and set up pending queue 
# 
setsockopt(SOCK, SOL_SOCKET, SO_REUSEADDR, 1) || 
	die "setsockopt() failed: $!\n"; 
bind(SOCK, $server_struct) || die "bind() failed: $!\n"; 
listen(SOCK, SOMAXCONN) || die "listen() failed: $!\n";

# Deal with requests 
# 
for ( ;; ) {
	# Grab next pending request 
	# 
	$remote_host = accept(NEWSOCK, SOCK); 
	die "accept() error: $!\n" unless ($remote_host);

	# We're the parent if fork() returns non-zero 
	# 
	last unless (fork()); 
	close(NEWSOCK); 
}

# *** If we've fallen out of the loop, then we're the child. ***

# Close master socket 
# 
close(SOCK);

# Resolve hostname of remote machine before calling chroot() 
# 
$raw_addr = (unpack("S n a4 x8", $remote_host))[2]; 
$dot_addr = join(".", unpack("C4", $raw_addr)); 
$name = (gethostbyaddr($raw_addr, AF_INET))[0];

# chroot() to docroot and then change our effective userid 
# 
chroot($docroot) || die "chroot() failed: $!\n"; 
$> = $uid;

# Read client request and get $path 
# 
while (<NEWSOCK>) { 
	last if (/^\s*$/); 
	next unless (/^GET /);
	$path = (split(/\s+/))[1];
}

# Print a line of logging info to STDOUT 
# 
print "$dot_addr\t$name\t$path\n";

# Respond with info or error message 
# 
if (open(FILE, "< $path")) { 
	@lines = <FILE>;
	print NEWSOCK @lines; 
	close(FILE); 
} 
else { 
	print NEWSOCK <<"EOErrMsg"; 
<TITLE>Error</TITLE><H1>Error</H1> 
The following error occurred while trying to retrieve your 
information: 
$! EOErrMsg 
}

# All done 
# 
close(NEWSOCK);
