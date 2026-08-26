class Saga < Formula
  desc "A code-first static site generator written in Swift"
  homepage "https://github.com/loopwerk/saga-cli"
  version "2.2.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
    url "https://github.com/loopwerk/saga-cli/releases/download/2.2.0/saga-macos-universal.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_linux do
    url "https://github.com/loopwerk/saga-cli.git", tag: "2.2.0"
    depends_on "swift" => :build
  end

  def install
    if OS.mac?
      bin.install "saga"
    else
      system "swift", "build", "-c", "release", "--product", "saga", "--disable-sandbox"
      bin.install ".build/release/saga"
    end
  end

  def caveats
    <<~EOS
      saga needs a Swift toolchain on your PATH. Both "saga build" and
      "saga dev" run swift in your project directory.
    EOS
  end

  test do
    assert_match "saga", shell_output("#{bin}/saga --help")
  end
end
