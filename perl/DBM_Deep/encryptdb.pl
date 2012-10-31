#!/usr/bin/perl

#use strict;
#use warnings;

 use DBM::Deep;
 use Crypt::Blowfish;
 use Crypt::CBC;
        
        my $cipher = new Crypt::CBC({
                'key'             => 'my secre',
                'keysize' => 8,
                'cipher'          => 'Blowfish',
                'iv'              => '12345678',
                'regenerate_key'  => 0,
                'padding'         => 'space',
                'prepend_iv'      => 0
        });
        
        my $db = new DBM::Deep(
                file => "foo-encrypt.db",
                filter_store_key => \&my_encrypt,
                filter_store_value => \&my_encrypt,
                filter_fetch_key => \&my_decrypt,
                filter_fetch_value => \&my_decrypt,
        );
        
        $db->{key1} = "value1";
        $db->{key2} = "value2";
        print "key1: " . $db->{key1} . "\n";
        print "key2: " . $db->{key2} . "\n";
        
        undef $db;
        exit;
        
        sub my_encrypt {
                return $cipher->encrypt( $_[0] );
        }
        sub my_decrypt {
                return $cipher->decrypt( $_[0] );
        }
