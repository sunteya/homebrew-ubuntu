require "active_support/all"
require "open-uri"
require "nokogiri"
require "digest/sha1"
require "pp"

# apt-get install quilt
# export QUILT_PATCHES=../debian/patches
# quilt push

html = open("https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/openssl/utopic-updates/files/111/debian/patches/")

patch_mappings = Nokogiri::HTML(html).css("#logentries tr").each_with_index.reduce({}) do |hash, (tr, index)|
  if index >= 2
    name = tr.css("td:first-child a:last-child").text
    path = tr.css("td:last-child a").first.try(:[], :href)
    hash.update(name => path.sub(/^\//, "https://bazaar.launchpad.net/"))
  end
  hash
end

patchs = %w(
  ca.patch
  config-hurd.patch
  debian-targets.patch
  engines-path.patch
  man-dir.patch
  man-section.patch
  no-rpath.patch
  no-symbolic.patch
  pic.patch
  valgrind.patch
  rehash-crt.patch
  shared-lib-ext.patch
  stddef.patch
  version-script.patch
  c_rehash-compat.patch
  block_diginotar.patch
  block_digicert_malaysia.patch
  defaults.patch
  openssl_fix_for_x32.patch
  req_bits.patch
  perlpath-quilt.patch
  ppc64-support
  CVE-2015-0209.patch
  CVE-2015-0286.patch
  CVE-2015-0287.patch
  CVE-2015-0288.patch
  CVE-2015-0289.patch
  CVE-2015-0293.patch
  CVE-2015-0209-2.patch
  CVE-2015-0293-2.patch
)

patch_with_checksums = {}
patchs.each do |patch|
  next if patch.start_with?("#")
  url = patch_mappings[patch]
  next if patch_with_checksums[url]

  puts "fetch #{url}"
  patch_with_checksums[url]= Digest::SHA1.hexdigest(open(url).read)
end

pp patch_with_checksums.map(&:reverse)

