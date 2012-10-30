# --- enc.pl ---
  #!/usr/bin/perl -w
  use strict;
  use Crypt::Blowfish;

  my $plaintext = <>;
  chomp $plaintext;
  my $key = "this is the pass phrase";
  my $cipher = Crypt::Blowfish->new($key);
  my $ciphertext = $cipher->encrypt($plaintext);
  print unpack ("H16", $ciphertext),"\n";


# --- dec.pl ---
  #!/usr/bin/perl -w
  use strict;
  use Crypt::Blowfish;

  my $ciphertext = <>;
  chomp $ciphertext;
  my $key = "this is the pass phrase";
  my $cipher = Crypt::Blowfish->new($key);
  my $plaintext = $cipher->decrypt(pack "H16",$ciphertext);
  print $plaintext,"\n";
