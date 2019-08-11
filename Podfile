# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
use_frameworks!


def shared_pods
    pod 'RxSwift', '~> 4.3'
end

target 'TesteiOS' do

    # UI
    pod 'MaterialComponents/TextFields', '~> 83.0.1'
    pod 'MaterialComponents/TextFields+Theming', '~> 83.0.1'
    pod 'MaterialComponents/TextFields+TypographyThemer', '~> 83.0.1'
    pod 'MaterialComponents/Buttons', '~> 83.0.1'
    pod 'MaterialComponents/Buttons+Theming', '~> 83.0.1'
    pod 'MaterialComponents/Tabs', '~> 83.0.1'

end

target 'Domain' do
    shared_pods
end

target 'Platform' do
    shared_pods

    # Database
    pod 'RealmSwift', '~> 3.10.0'
    pod 'RxRealm', '~> 0.7.5'
    
    # HTTP
    pod 'RxAlamofire', '~> 4.4'
end
