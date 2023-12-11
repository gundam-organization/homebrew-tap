# Ruby script that describes how GUNDAM should be installed on your computer

class Gundam < Formula
  desc "Statistical analysis tool that allows to host various studies with config files"
  homepage "https://github.com/gundam-organization/gundam"
  url "https://github.com/gundam-organization/gundam.git",
    tag:      "1.8.0",
    revision: "c799c10017b51bbfca88c8216a94dfb8eaca4558"
  license "LGPL-2.1-or-later"
  head "https://github.com/gundam-organization/gundam.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "nlohmann-json" => :build
  depends_on "yaml-cpp" => :build
  depends_on "zlib" => :build
  depends_on "root"

  def install
    args = std_cmake_args + %w[
      -D WITH_GUNDAM_ROOT_APP=OFF
      -D USE_STATIC_LINKS=ON
    ]

    ENV["ROOTSYS"]="$(brew --prefix)"
    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
