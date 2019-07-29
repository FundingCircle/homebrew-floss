# NB: DO NOT EDIT THIS FILE IT IS GENERATED FROM A TEMPLATE!
class Fc4 < Formula
  desc 'A tool for authoring, publishing, and maintaining C4 software architecture diagrams.'
  homepage 'https://fundingcircle.github.io/fc4-framework/tool/'
  version '2019-07-26_1982'

  if OS.linux?
    url 'https://github.com/FundingCircle/fc4-framework/releases/download/release_2019-07-26_1982/fc4-tool-linux-amd64-bc5542c.tar.gz'
    sha256 'a9e79d4ef86be08eca53134ceb817e3ba7923229160cec8a7bbe5779d43dba87'
  else
    url 'https://github.com/FundingCircle/fc4-framework/releases/download/release_2019-07-26_1982/fc4-tool-macos-amd64-bc5542c.tar.gz'
    sha256 '5a4bed359e5deb31e0acf1ed3954bfcdf615038939e4a5eb6f251ae315beb443'
  end

  bottle :unneeded
  depends_on java: '1.8+'

  def caveats
    <<~CAVEAT
      In addition to the declared dependency on Java, this formula also requires Chromium or Chrome.
      If needed, you may be able to install Chromium via `brew cask install chromium`
    CAVEAT
  end

  def install
    bin.install 'fc4'
    bin.install 'fc4-render'
    bin.install 'fc4.jar'
  end

  resource 'test_diagram_source' do
    url 'https://raw.githubusercontent.com/FundingCircle/fc4-framework/c582061ef9d5ad6d680eed71cd55bb2d1e8c3230/docs/tool/fc4-tool-01-context.yaml'
    sha256 '137207ad4ebda15e96c9db20a2bb275f6ba69db8f9c306a174f1aa418d7f528d'
  end

  def test
    resource('test_diagram_source').stage(testpath)
    system "#{bin}/fc4 -fs #{testpath}/fc4-tool-01-context.yaml"
  end
end
