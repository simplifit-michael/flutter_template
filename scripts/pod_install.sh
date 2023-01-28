cd ios
rm Podfile.lock
rm -rf ~/.cocoapods/repos/trunk
pod install
cd ..