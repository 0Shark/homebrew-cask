cask "medisync-dictate" do
  arch arm: "arm64", intel: "x64"

  version "0.4.5"
  sha256 arm:   "d643b4e3618e9a7cf57b0478411d48d7c228f1d187bfb911e28b461a7a93defc",
         intel: "f9a368b89fa9af6b2b06348da78bd4f9810369d3a634382ef44be5348a2b6b9b"

  url "https://downloads.medisync.me/dictate/stable/#{version}/MediSync-Dictate-#{version}-#{arch}.dmg"
  name "MediSync Dictate"
  desc "Dictation tool that runs on the device"
  homepage "https://medisynchealth.ai/en/dictate"

  livecheck do
    url "https://downloads.medisync.me/dictate/stable/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "MediSync Dictate.app"

  zap trash: [
    "~/Library/Application Support/MediSync Dictate",
    "~/Library/Caches/me.medisync.dictate",
    "~/Library/Caches/me.medisync.dictate.ShipIt",
    "~/Library/Logs/MediSync Dictate",
    "~/Library/Preferences/me.medisync.dictate.plist",
    "~/Library/Saved Application State/me.medisync.dictate.savedState",
  ]
end
