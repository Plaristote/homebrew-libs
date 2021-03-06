require "formula"

class Crails < Formula
  homepage "https://github.com/Plaristote/crails"

  head 'https://github.com/Plaristote/crails.git'

  depends_on 'cmake' => :build

  depends_on 'boost'
  depends_on 'cpp-netlib'

  depends_on 'mongo-cxx-driver' => :optional
  depends_on 'soci'             => :optional

  option 'async', 'compile with multi-thread support'

  def install
    args  = std_cmake_args
    args << '-DUSE_MONGODB=ON'     if build.with?    'mongo-cxx-driver'
    args << '-DUSE_SOCI=ON'        if build.with?    'soci'
    args << '-DUSE_MULTITHREAD=ON' if build.include? 'async'

    # Install Boots
    system 'cd', 'Boots'
    system 'cmake', '.'
    system 'make', 'install'
    prefix.install 'install_manifest.txt'
    system 'cd', '..'

    # Install Crails
    system 'cmake', '.', *args
    system 'make', 'install'
    prefix.install 'install_manifest.txt'
  end
end
