# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
use_frameworks!


def shared_pods
    pod 'RxSwift', '~> 4.3'
end

target 'TesteiOS' do

    # UI
    pod 'MaterialComponents/TextFields', '~> 84.0.0'
    pod 'MaterialComponents/TextFields+Theming', '~> 84.0.0'
    pod 'MaterialComponents/TextFields+TypographyThemer', '~> 84.0.0'
    pod 'MaterialComponents/Buttons', '~> 84.0.0'
    pod 'MaterialComponents/Buttons+Theming', '~> 84.0.0'
    pod 'MaterialComponents/Tabs', '~> 84.0.0'
    pod 'MaterialComponents/Tabs+Theming', '~> 84.0.0'
    pod 'MaterialComponents/Tabs+TypographyThemer', '~> 84.0.0'
    
    # dependency injection
    pod 'Swinject', '~> 2.6.2'
    pod 'SwinjectStoryboard', '~> 2.2.0'
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

target 'Tests' do
  shared_pods
end
