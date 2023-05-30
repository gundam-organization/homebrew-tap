# Ruby script that describes how GUNDAM should be installed on your computer

class Gundam < Formula
  desc "Statistical analysis tool that allows to host various studies with config files"
  homepage "https://github.com/gundam-organization/gundam"
  url "https://github.com/gundam-organization/gundam.git",
    tag:      "1.7.1",
    revision: "cbcbf2a16a844294cf6acf5721b26d1fa6dc61e5"
  license "LGPL-2.1 license"
  head "https://github.com/gundam-organization/gundam.git", branch: "main"

  # bottle do
  #   rebuild 1
  #   sha256 cellar: :any, arm64_ventura: "22a95a3ead8a4a6fb45149abe6f8162cffffd08ba12c84fa30234b9d7c7f4cc6"
  # end

  depends_on "cmake" => :build
  depends_on "yaml-cpp" => :build
  depends_on "nlohmann-json" => :build
  depends_on "zlib" => :build
  depends_on "root"

  def install
    args = std_cmake_args + %w[
      -D WITH_GUNDAM_ROOT_APP=OFF
      -D USE_STATIC_LINKS=ON
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

end
