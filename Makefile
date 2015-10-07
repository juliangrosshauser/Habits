PROJECT = Habits.xcodeproj
SCHEME = Habits
CONFIGURATION = Debug
SDK = iphonesimulator
DESTINATION_IPHONE = 'name=iPhone 6s'
DESTINATION_IPHONE_PLUS = 'name=iPhone 6s Plus'
DESTINATION_IPAD = 'name=iPad Air 2'

.PHONY: all test clean-Carthage clean-xcodebuild clean

all: test

Carthage:
	carthage bootstrap --platform iOS

test: Carthage
	set -o pipefail && xcodebuild \
	-project $(PROJECT) \
	-scheme $(SCHEME) \
	-configuration $(CONFIGURATION) \
	-sdk $(SDK) \
	-destination $(DESTINATION_IPHONE) \
	-destination $(DESTINATION_IPHONE_PLUS) \
	-destination $(DESTINATION_IPAD) \
	 test | xcpretty -c

clean-Carthage:
	rm -rf ./Carthage

clean-xcodebuild:
	xcodebuild \
	-project $(PROJECT) \
	-scheme $(SCHEME) \
	-configuration $(CONFIGURATION) \
	-sdk $(SDK) \
	-destination $(DESTINATION_IPHONE) \
	-destination $(DESTINATION_IPHONE_PLUS) \
	-destination $(DESTINATION_IPAD) \
	 clean

clean: clean-xcodebuild clean-Carthage
