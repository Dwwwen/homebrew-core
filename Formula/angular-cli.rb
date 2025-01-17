require "language/node"

class AngularCli < Formula
  desc "CLI tool for Angular"
  homepage "https://cli.angular.io/"
  url "https://registry.npmjs.org/@angular/cli/-/cli-15.0.0.tgz"
  sha256 "f4e31056b435c9a1ac8cc85cb3b41f225152c5f90775165513aab6f5dce77815"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "670cb6bc7d93d0912dfb4ee166b1cfc3ba27323e66228d9c7cfa1b8bf9434dac"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "670cb6bc7d93d0912dfb4ee166b1cfc3ba27323e66228d9c7cfa1b8bf9434dac"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "670cb6bc7d93d0912dfb4ee166b1cfc3ba27323e66228d9c7cfa1b8bf9434dac"
    sha256 cellar: :any_skip_relocation, monterey:       "6eeadd068fb1ab57f922200b94832b9d44674835fd50bed2007c96a3710ec417"
    sha256 cellar: :any_skip_relocation, big_sur:        "6eeadd068fb1ab57f922200b94832b9d44674835fd50bed2007c96a3710ec417"
    sha256 cellar: :any_skip_relocation, catalina:       "6eeadd068fb1ab57f922200b94832b9d44674835fd50bed2007c96a3710ec417"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "670cb6bc7d93d0912dfb4ee166b1cfc3ba27323e66228d9c7cfa1b8bf9434dac"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"ng", "new", "angular-homebrew-test", "--skip-install"
    assert_predicate testpath/"angular-homebrew-test/package.json", :exist?, "Project was not created"
  end
end
