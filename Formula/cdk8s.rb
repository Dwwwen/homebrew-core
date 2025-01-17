require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.49.tgz"
  sha256 "767572fa3e66dc7442f2c7b2997fa6bde79e38ba8af69b8e5a755b3b4e3c42d1"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "7ea392daeb3ee69aeadb70de55ebf5f6dd6403e363fe443b5fd514da16dec179"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
