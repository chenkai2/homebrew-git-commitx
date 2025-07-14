class GitCommitx < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/chenkai2/homebrew-git-commitx"
  url "https://github.com/chenkai2/homebrew-git-commitx/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "20d8d69ae210eb0d9fd2fbba825882c81a2b9a2700aea4574369e89fc01a709b" # Replace with actual SHA256 when available
  license "MIT"
  head "https://github.com/chenkai2/homebrew-git-commitx.git", branch: "main"

  # Build dependencies
  depends_on "go" => :build

  def install
    # Set Go module environment
    ENV["GO111MODULE"] = "on"
    
    # Compile and install binary
    # -s -w flags reduce binary size by removing debug information
    system "go", "build", "-trimpath",
           "-ldflags", "-s -w -X github.com/chenkai2/homebrew-git-commitx/i18n.Version=#{version}",
           "-o", bin/"git-commitx"
    
    # Install shell completions if they become available in the future
    # bash_completion.install "completions/git-commitx.bash" => "git-commitx"
    # zsh_completion.install "completions/git-commitx.zsh" => "_git-commitx"
    # fish_completion.install "completions/git-commitx.fish"
    
    # Install man pages if they become available in the future
    # man1.install "man/git-commitx.1"
  end

  test do
    # Test if command is executable and returns help information
    assert_match "AI-powered Git commit message generator", shell_output("#{bin}/git-commitx --help")
    
    # Test behavior in a Git repository
    system "git", "init", "test-repo"
    Dir.chdir("test-repo") do
      assert_match "No staged files found", shell_output("#{bin}/git-commitx 2>&1", 0)
    end
  end
end