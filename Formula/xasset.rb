# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Xasset < Formula
    desc "`xlist` is a command-line tool to list folders with `.imageset` or `.colorset` extensions in Xcode asset catalogs."
  homepage "https://github.com/mhasan341/homebrew-xasset"
  url "https://github.com/mhasan341/homebrew-xasset/releases/download/v1.0.0/xasset.sh"
  sha256 "ba85409ad0e51dc9872fafc406c45c0d691cf9354f39bd5e84391ffe12b886e0"
  license "MIT"


  def install
      bin.install "xasset"
  end

  test do
      system "#{bin}/xasset", "--version"
  end
end
