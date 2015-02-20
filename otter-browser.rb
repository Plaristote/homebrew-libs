require "formula"

class OtterBrowser < Formula
  homepage "http://otter-browser.org/"

  head 'https://github.com/Emdek/otter.git'

  depends_on 'cmake' => :build
  depends_on 'qt5'

  def install
    system 'cmake', '.'
    system 'make'
    system 'make', 'install'
    prefix.install 'install_manifest.txt'
  end
end
