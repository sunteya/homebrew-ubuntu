linuxbrew_openssl = File.expand_path("../../Linuxbrew/openssl.rb", __FILE__)
Pathname.new(linuxbrew_openssl).tap do |f|
  binding.eval(f.read, f.to_s)
end

Openssl.class_eval do
  revision 1

  specs.each do |spec|
    spec.resource("cacert").checksum = Checksum.new(:sha1, "1d6fef5a6a5ad01f52e31e274e2d811b2b794e80")
  end

  # Apply all patch from openssl-1.0.1f-1ubuntu9.4 (2015-03-09)
  patch :DATA
  [
    [ "647f907a3e684c633b6c006a3dc0acbe2ec8c62c", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20100227122403-cbzez3226f0akkd9/ca.patch-20091202121218-l1y2dvoxkhvgqoa8-2703/ca.patch" ],
    [ "05c86ca9a96a6e206102e658dbd2903030f4f03e", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20101212153721-rho6hw4976n5vuak/confighurd.patch-20091202121218-l1y2dvoxkhvgqoa8-2723/config-hurd.patch" ],
    [ "73f736d7f14d3fa6aaceb190b7ef050fc76ed52c", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20131222192535-lt5dnlsktamqykym/debiantargets.patch-20091202121218-l1y2dvoxkhvgqoa8-2716/debian-targets.patch" ],
    [ "03963e8f76c494543307e1d7549b4879a6fb0287", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20101212153721-rho6hw4976n5vuak/enginespath.patch-20091202121218-l1y2dvoxkhvgqoa8-2705/engines-path.patch" ],
    [ "f0ec71f2f775d63b9312f3a7dce9afbc0efb93f8", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20101212153721-rho6hw4976n5vuak/mandir.patch-20091202121218-l1y2dvoxkhvgqoa8-2712/man-dir.patch" ],
    [ "b8c8ddb8fc61c3a073f51816d29befcbe48bf7fa", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20101212153721-rho6hw4976n5vuak/mansection.patch-20091202121218-l1y2dvoxkhvgqoa8-2727/man-section.patch" ],
    [ "ed0f28786487d259077aa9aacaf8871ac5fa30d3", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20101212153721-rho6hw4976n5vuak/norpath.patch-20091202121218-l1y2dvoxkhvgqoa8-2704/no-rpath.patch" ],
    [ "e796b5719a05928375250079453d952c6515a4f6", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20101212153721-rho6hw4976n5vuak/nosymbolic.patch-20091202121218-l1y2dvoxkhvgqoa8-2718/no-symbolic.patch" ],
    [ "53326b7e846ce0115cbd4cc06b91925f0acf87f4", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20120717114919-jtcpu3ajfoe3dm8s/pic.patch-20091202121218-l1y2dvoxkhvgqoa8-2729/pic.patch" ],
    [ "cc212047b9c8e840572cdc9566b3931fa2132c49", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20101212153721-rho6hw4976n5vuak/valgrind.patch-20091202121218-l1y2dvoxkhvgqoa8-2719/valgrind.patch" ],
    [ "71f8dfff1b9c06b3ebbc13b148e1fdaf74dfb087", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20101212153721-rho6hw4976n5vuak/rehashcrt.patch-20091202121218-l1y2dvoxkhvgqoa8-2714/rehash-crt.patch" ],
    [ "dfef3b12849ddb29365a699d4483664ad34e0177", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20101212153721-rho6hw4976n5vuak/sharedlibext.patch-20091202121218-l1y2dvoxkhvgqoa8-2717/shared-lib-ext.patch" ],
    [ "410bb1cb388105fdb439d28786e7609bd65ddb05", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20090811211918-q52b1berxicp30hh/stddef.patch-20091202121218-l1y2dvoxkhvgqoa8-2709/stddef.patch" ],
    [ "267963fdcdba6866e30f1c8957540c14eacb0643", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20130211193944-mf5t31tqqcrgdz2o/versionscript.patch-20091202121218-l1y2dvoxkhvgqoa8-2713/version-script.patch" ],
    [ "fcebc58244a3cb80c490da94689c6571baa3d0ac", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20110413223649-ykr5kaujl1341a2t/c_rehashcompat.patch-20110414153845-fmx6wgiolnui5gxu-4/c_rehash-compat.patch" ],
    [ "af6e166ba2b0078eb00cbd7ce09d906747c4f106", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20110910120313-bhadsls12rfktiwj/block_diginotar.patc-20110910214012-5zxdcvytndoa0gso-14/block_diginotar.patch" ],
    [ "f581c1756183aa232b36562cf5eb7c63e3282739", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20111106013930-lzze1aqzy1hfnmg1/block_digicert_malay-20111108093632-g29phzfi2d856tyw-4/block_digicert_malaysia.patch" ],
    [ "67ad93d4c7b504de6204b28b62914f28bc4a64fb", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20131222192535-lt5dnlsktamqykym/defaults.patch-20131222222818-sv8bl16c23ne5x33-40/defaults.patch" ],
    [ "2f5e93e9ab95ceecf31e3cc63dca8f3d0b63cd32", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20130520165606-1xhp9oowuiiwkahz/openssl_fix_for_x32.-20131211004731-0jldhfg3mul65gx5-214/openssl_fix_for_x32.patch" ],
    [ "703900e5dd0425a0b5b931a1907938591164051b", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20131222192535-lt5dnlsktamqykym/req_bits.patch-20131222222818-sv8bl16c23ne5x33-23/req_bits.patch" ],
    [ "f36ca9c4425f622ae8aae0a43249824d4d2ae7e0", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/james.westby%40ubuntu.com-20100614090829-nf3nrftn7ly58mxv/perlpathquilt.patch-20100614171502-3rdvrwb4moxn2kce-50/perlpath-quilt.patch" ],
    [ "ea389ce8639020942094f965f560ea7f64b9e8c4", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20131205143448-9bj4o92owv7n5c4w/ppc64support-20131211004731-0jldhfg3mul65gx5-248/ppc64-support" ],
    [ "e9dfa61b0b48e5e36d6581e42e50dcc3c0daada5", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20150319100554-8629w5x23dwlywlg/cve20150209.patch-20150319152757-owbityizibdpj88r-27/CVE-2015-0209.patch" ],
    [ "dbea200b004f1f0d5ec6269bbdb52e6d7668678b", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20150319100554-8629w5x23dwlywlg/cve20150286.patch-20150319152757-owbityizibdpj88r-37/CVE-2015-0286.patch" ],
    [ "430d6c5ab79cac40bb70947663a29693165ffff6", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20150319100554-8629w5x23dwlywlg/cve20150287.patch-20150319152757-owbityizibdpj88r-8/CVE-2015-0287.patch" ],
    [ "7962b8c056c54d3f84f1823b7845bac377538e93", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20150319100554-8629w5x23dwlywlg/cve20150288.patch-20150319152757-owbityizibdpj88r-10/CVE-2015-0288.patch" ],
    [ "493f9612bc08d7a1b04b24ab32f286d461fbaf1d", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20150319100554-8629w5x23dwlywlg/cve20150289.patch-20150319152757-owbityizibdpj88r-1/CVE-2015-0289.patch" ],
    [ "477cfaba75d8f9ee275110b141b12399b256db11", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20150319100554-8629w5x23dwlywlg/cve20150293.patch-20150319152757-owbityizibdpj88r-44/CVE-2015-0293.patch" ],
    [ "af2e690e458faf5b446eda93bbc53a1bf2a64a90", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20150319100554-8629w5x23dwlywlg/cve201502092.patch-20150319152757-owbityizibdpj88r-25/CVE-2015-0209-2.patch" ],
    [ "843bb85a3db5cd362edb37f43032cf0806e49d7c", "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/download/package-import%40ubuntu.com-20150319100554-8629w5x23dwlywlg/cve201502932.patch-20150319152757-owbityizibdpj88r-12/CVE-2015-0293-2.patch" ]
  ].each do |info|
    patch do
      url info.last
      sha1 info.first
    end
  end

end

__END__
diff -aurN openssl-1.0.1l.orig/apps/req.c openssl-1.0.1l/apps/req.c
--- openssl-1.0.1l.orig/apps/req.c	2015-03-21 14:20:49.000000000 +0000
+++ openssl-1.0.1l/apps/req.c	2015-03-21 14:22:40.000000000 +0000
@@ -657,6 +657,12 @@
 				goto end;
 			}
 	
+		if (newkey <= 0)
+			{
+			if (!NCONF_get_number(req_conf,SECTION,BITS, &newkey))
+				newkey=DEFAULT_KEY_LENGTH;
+			}
+
 		if (newkey < MIN_KEY_LENGTH && (pkey_type == EVP_PKEY_RSA || pkey_type == EVP_PKEY_DSA))
 			{
 			BIO_printf(bio_err,"private key length is too short,\n");
