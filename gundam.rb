# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Gundam < Formula
  desc "GUNDAM is a suite of applications which aims at performing various statistical analysis with different purposes and setups"
  homepage "https://github.com/gundam-organization/gundam"
  url "https://github.com/gundam-organization/gundam.git",
      :tag => "1.7.1",
      :revision => "cbcbf2a16a844294cf6acf5721b26d1fa6dc61e5"
  sha256 "37aa215c0020198b453220bef4f8745bf656e1bec821f12919f4d7f5ee1193da"
  license "LGPL-2.1 license"
  head "https://github.com/gundam-organization/gundam.git", branch: "main"

  bottle do
    rebuild 1
    sha256 cellar: :any, arm64_ventura: "22a95a3ead8a4a6fb45149abe6f8162cffffd08ba12c84fa30234b9d7c7f4cc6"
  end

  # depends_on "cmake" => :build

  depends_on "root"
  depends_on "zlib" => :build
  depends_on "cmake" => :build
  depends_on "yaml-cpp" => :build
  depends_on "nlohmann-json" => :build

  def install

    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"

    args = std_cmake_args + %W[
      -D WITH_GUNDAM_ROOT_APP=OFF
      -D USE_STATIC_LINKS=ON
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

end
