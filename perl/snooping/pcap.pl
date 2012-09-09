#!/usr/bin/perl -w

  use strict;
  use Net::PcapUtils;

      sub process_pkt {
            print("packet\n");
              }

                Net::PcapUtils::loop(\&process_pkt, FILTER => 'ip');
