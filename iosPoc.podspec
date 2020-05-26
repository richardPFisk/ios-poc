#
# Be sure to run `pod lib lint notification-centre.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iosPoc'
  s.version          = '0.2.1'
  s.summary          = 'iosPoc proof of concept'

  s.description      =  "Proof of concept for server driven UIs, using the notification centre domain"

  s.homepage         = 'https://github.com/richardpFisk/ios-poc'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Richard Fisk' => 'rfisk@seek.com.au' }
  s.source           = { :git => 'https://github.com/richardPFisk/ios-poc.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.4'

  s.source_files = 'iosPoc/Classes/**/*'

   s.frameworks = 'SwiftUI'
   s.dependency 'URLImage'
   s.dependency 'AWSAppSync'
   s.swift_versions = '5.0'
   s.pod_target_xcconfig = {
   'ONLY_ACTIVE_ARCH' => 'YES'
   }
end
