class Gundam < Formula
  desc "Statistical analysis tool that allows to host various studies with config files"
  homepage "https://github.com/gundam-organization/gundam"
  url "https://github.com/gundam-organization/gundam.git",
    tag:      "1.8.9",
    revision: "09305abff5a7c09dc783b6f524a3529112cfce75"
  license "LGPL-2.1-or-later"
  head "https://github.com/gundam-organization/gundam.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "nlohmann-json" => :build
  depends_on "root"
  depends_on "yaml-cpp"
  depends_on "zlib"

  def install
    ENV["ROOTSYS"] = formula_opt_prefix("root")

    args = %w[
      -D WITH_GUNDAM_ROOT_APP=OFF
      -D USE_STATIC_LINKS=ON
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/gundamFitter 2>&1", 1)
  end
end
