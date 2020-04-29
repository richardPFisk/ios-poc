#
# Be sure to run `pod lib lint notification-centre.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iosPoc'
  s.version          = '0.1.3'
  s.summary          = 'iosPoc proof of concept'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      =  "Proof of concept for server driven UIs, using the notification centre domain"

  s.homepage         = 'https://github.com/richardpFisk/ios-poc'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Richard Fisk' => 'rfisk@seek.com.au' }
  s.source           = { :git => 'https://github.com/richardPFisk/ios-poc.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.4'

  s.source_files = 'iosPoc/Classes/**/*'
  
  # s.resource_bundles = {
  #   'notification-centre' => ['notification-centre/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'SwiftUI'
   s.dependency 'URLImage'
   s.dependency 'AWSAppSync'
   s.swift_versions = '4.0'
end
