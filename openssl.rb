(HOMEBREW_LIBRARY/"Formula/openssl.rb").tap do |f|
  binding.eval(f.read, f.to_s)
end

Openssl.class_eval do
  patch do
    url "https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/vivid/openssl/vivid/download/head:/versionscript.patch-20091202121218-l1y2dvoxkhvgqoa8-2713/version-script.patch"
    sha1 "267963fdcdba6866e30f1c8957540c14eacb0643"
  end

  patch :DATA
end

__END__
--- openssl-1.0.1j.orig/openssl.ld	2014-12-25 22:44:31.526884346 +0800
+++ openssl-1.0.1j/openssl.ld	2014-12-25 22:43:35.954883752 +0800
@@ -3763,6 +3763,7 @@
 		BIO_set_callback;
 		d2i_ASIdOrRange;
 		i2d_ASIdentifiers;
+		CRYPTO_memcmp;
 		SEED_decrypt;
 		SEED_encrypt;
 		SEED_cbc_encrypt;
