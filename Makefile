.PHONY: all test clean
default:
	xcodebuild -target "Test (Device)" -configuration Release -sdk iphoneos build && open build/Release
	xcodebuild -target "Test (Simulator)" -configuration Release -sdk iphoneos build && open build/Release
	BUILD_DIR="build" BUILD_STYLE="Debug" sh ../Scripts/CombineLibs.sh
	sh ../Scripts/iPhoneFramework.sh
	
# If you need to clean a specific target/configuration: $(COMMAND) -target $(TARGET) -configuration DebugOrRelease -sdk $(SDK) clean
clean:
	-rm -rf build/*

test:
	GHUNIT_CLI=1 xcodebuild -target Test -configuration Debug -sdk iphonesimulator build
	