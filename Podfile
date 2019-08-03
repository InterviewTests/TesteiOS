# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
use_frameworks!


def shared_pods
    pod 'RxSwift', '~> 4.3'
end

target 'TesteiOS' do

    # UI
    pod 'MaterialComponents/TextFields'
    pod 'MaterialComponents/TextFields+Theming'
    pod 'MaterialComponents/TextFields+TypographyThemer'
    pod 'MaterialComponents/Buttons'
    pod 'MaterialComponents/Buttons+Theming'
    pod 'MaterialComponents/Tabs'

end

target 'Domain' do
    shared_pods
end

target 'Platform' do
    shared_pods

    # Database
    pod 'RealmSwift', '~> 3.10.0'
    pod 'RxRealm', '~> 0.7.5'
end
