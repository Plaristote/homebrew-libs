require "formula"

class MongoCxxDriver < Formula
  pkg     = 'mongo-cxx-driver'
  sub_pkg = 'legacy'
  pkg_ver = '1.0.0-rc1'

  homepage  "http://www.mongodb.org"
  url       "https://github.com/mongodb/#{pkg}/archive/#{sub_pkg}-#{pkg_ver}.tar.gz"
  sha1      "15793d1c33019ff7fb10bd2f83c3c66c2c62210b"

  depends_on 'boost'
  depends_on 'scons' => :build

  def install
    system 'scons --ssl --prefix=/usr/local --sharedclient --c++11 install'
  end
end
