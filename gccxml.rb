require "formula"

class Gccxml < Formula
  homepage "http://gccxml.github.io/"
  version "git"
  url "https://github.com/gccxml/gccxml/archive/master.zip"
  sha1 "" # This is a git repository, checking integrity wouldn't work most of the time anyway

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
