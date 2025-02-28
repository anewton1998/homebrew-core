class FernApi < Formula
  desc "Stripe-level SDKs and Docs for your API"
  homepage "https://buildwithfern.com/"
  url "https://registry.npmjs.org/fern-api/-/fern-api-0.51.5.tgz"
  sha256 "e2962ce3cae9ee82dedaa4b64078c82943233abd0f52967a2d6150baf4294cd5"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "59219196dbdda07a9888e72e5b84cfac34765f8c79cf90bdf9bd50f40fa5ffd3"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"fern", "init", "--docs", "--org", "brewtest"
    assert_path_exists testpath/"fern/docs.yml"
    assert_match "\"organization\": \"brewtest\"", (testpath/"fern/fern.config.json").read

    system bin/"fern", "--version"
  end
end
