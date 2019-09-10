class Fc4 < Formula
  desc "Tool for C4 software architecture diagrams"
  homepage "https://fundingcircle.github.io/fc4-framework/tool/"
  version "${VERSION}"

  if OS.linux?
    url "https://github.com/FundingCircle/fc4-framework/releases/download/${TAG_NAME}/${LINUX_FILENAME}"
    sha256 "${LINUX_SHA}"
  else
    url "https://github.com/FundingCircle/fc4-framework/releases/download/${TAG_NAME}/${MACOS_FILENAME}"
    sha256 "${MACOS_SHA}"
  end

  bottle :unneeded
  depends_on :java => "1.8+"

  resource "test_diagram_source" do
    url "https://raw.githubusercontent.com/FundingCircle/fc4-framework/c582061ef9d5ad6d680eed71cd55bb2d1e8c3230/docs/tool/fc4-tool-01-context.yaml"
    sha256 "137207ad4ebda15e96c9db20a2bb275f6ba69db8f9c306a174f1aa418d7f528d"
  end

  def install
    bin.install "fc4"
    bin.install "fc4-render"

    # brew audit doesn’t like this; it prints:
    #   Non-executables were installed to "/usr/local/opt/fc4/bin"
    # ...it wants jar files installed to libexec, which we should be able to do but first we’ll need
    # to update the script `fc4` which lives in the fc4-framework repo; right now it expects the jar
    # file to be in the same dir as the script; we’ll need to change it to maybe look in a few
    # different places? I’m not sure; I want to continue to support the manual install case for
    # those who cannot or prefer not to use Homebrew.
    bin.install "fc4.jar"
  end

  def caveats
    <<~CAVEAT
      In addition to the declared dependency on Java, this formula also requires Chromium or Chrome.
      If needed, you may be able to install Chromium via `brew cask install chromium`
    CAVEAT
  end

  test do
    resource("test_diagram_source").stage(testpath)
    system "#{bin}/fc4", "-fs", "#{testpath}/fc4-tool-01-context.yaml"
  end
end
