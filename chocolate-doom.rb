require 'formula'

class ChocolateDoom < Formula
  homepage "http://www.chocolate-doom.org/"
  url "http://www.chocolate-doom.org/downloads/2.2.1/chocolate-doom-2.2.1.tar.gz"
  sha256 "ad11e2871667c6fa0658abf2dcba0cd9b26fbd651ee8df55adfdc18ad8fd674a"

  bottle do
    cellar :any
    sha256 "5567c379e22722310d5e818e6730c482258ce550cb8bce684ed4d32b5f47ad17" => :yosemite
    sha256 "7b364c31c685ffe93721b0bb4e5bbe994ce9d4e9446fd7705b34c7dc7b812a0d" => :mavericks
    sha256 "394c2b0a47e3f71fa13b21669e1bff2b5a850abf054fcc37c0ac8e849e9e2c93" => :mountain_lion
  end

  depends_on "sdl"
  depends_on "sdl_net"
  depends_on "sdl_mixer"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-sdltest"
    system "make install"

    # This project installs to 'games', but we want it in 'bin' so it symlinks in.
    # Can't find a ./configure switch, so just rename it.
    (prefix+"games").rename bin
  end

  def caveats; <<-EOS.undent
    Note that this formula only installs a Doom game engine, and no
    actual levels. The original Doom levels are still under copyright,
    so you can copy them over and play them if you already own them.
    Otherwise, there are tons of free levels available online.
    Try starting here:
      #{homepage}
    EOS
  end
end
