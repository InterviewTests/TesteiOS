if [ "$1" == "--install-bundler" ]; then
    bundle install
fi

if [ "$1" == "--force" ]; then
    rm -rf "${HOME}/Library/Caches/CocoaPods"
    rm -rf "`pwd`/Pods/"
fi

xcodegen
bundle exec pod install