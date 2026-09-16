class Freeduck < Formula
  desc "Command-line interface for Freeduck (a Cyberduck fork)"
  homepage "https://duck.sh/"
  url "${ARCHIVE}"
  sha256 "${ARCHIVE.SHA256}"
  license "GPL-3.0-only"

  depends_on "openjdk@21"

  def install
    # Because compiling would need a JDK and xcodebuild we just use the pre-compiled binary.
    libexec.install Dir["*"]
    rm_r "#{libexec}/Contents/PlugIns/Runtime.jre"
    ln_s Formula["openjdk@21"].libexec/"openjdk.jdk", "#{libexec}/Contents/PlugIns/Runtime.jre"
    bin.install_symlink "#{libexec}/Contents/MacOS/freeduck" => "freeduck"
  end

  test do
    unless "Freeduck ${VERSION} (${REVISION})\n".eql? %x(`#{bin}/freeduck -version`)
      raise "Version mismatch"
    end
    filename = (testpath/"test")
    system "#{bin}/freeduck", "--download", stable.url, filename
    filename.verify_checksum stable.checksum
  end
end
