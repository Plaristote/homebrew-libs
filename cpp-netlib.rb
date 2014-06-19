require "formula"

class CppNetlib < Formula
  homepage ""
  url "http://commondatastorage.googleapis.com/cpp-netlib-downloads/0.11.0/cpp-netlib-0.11.0.tar.gz"
  sha1 "1879224d50681b1398eb8ca6f34f49d679f40b34"

  depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end
end
