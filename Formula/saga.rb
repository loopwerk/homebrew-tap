class Saga < Formula
  desc "A code-first static site generator written in Swift"
  homepage "https://github.com/loopwerk/Saga"
  url "https://github.com/loopwerk/Saga.git", tag: "2.16.0"
  version "1.1.0"
  license "MIT"

  depends_on xcode: ["13.0", :build]
  depends_on macos: :monterey

  def install
    system "swift", "build", "-c", "release", "--product", "saga", "--disable-sandbox"
    bin.install ".build/release/saga"
  end

  test do
    system bin/"saga", "--help"
  end
end
