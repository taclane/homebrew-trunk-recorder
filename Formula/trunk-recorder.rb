class TrunkRecorder < Formula
  desc "Trunked & Conventional Radio Recorder"
  homepage "https://github.com/robotastic/trunk-recorder"
  url "https://github.com/robotastic/trunk-recorder/archive/refs/tags/v4.6.0.tar.gz"
  sha256 "01c85bd8504c19c138f52a7e1ba7cfabd6e539b0d202b4ed4d6f26ed8b61935f"
  license "GPL-3.0-or-later"

  head do
    url "https://github.com/robotastic/trunk-recorder.git", branch: "master"
  end

  depends_on "cmake" => :build
  depends_on "cppunit" => :build
  depends_on "pkgconfig" => :build
  depends_on "pybind11" => :build
  depends_on "boost"
  depends_on "curl"
  depends_on "fdk-aac-encoder"
  depends_on "fmt"
  depends_on "gmp"
  depends_on "gnuradio"
  depends_on "gr-osmosdr"
  depends_on "openssl@3"
  depends_on "sox"
  depends_on "spdlog"
  depends_on "uhd"
  depends_on "volk"

  def install
    args = %W[
      -Bbuild
      -DOPENSSL_ROOT_DIR=#{Formula["openssl@3"].opt_prefix}
    ]
      system "cmake", *std_cmake_args, *args
      system "make", "-C", "build", "install"
  end
end