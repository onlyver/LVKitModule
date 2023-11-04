#
# Be sure to run `pod lib lint LVKitModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LVKitModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of LVKitModule.'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
  s.description      = <<-DESC
  TODO: Add long description of the pod here.
  DESC
  
  s.homepage         = 'https://github.com/onlyver/LVKitModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'onlyver' => '1072539675@qq.com' }
  s.source           = { :git => 'https://github.com/onlyver/LVKitModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '10.0'
  s.source_files = 'LVKitModule/Classes/**/*'
  s.resource_bundles = {
    'LVKitModule' => ['LVKitModule/Assets/*.xcassets']
  }
  # s.resource_bundles = {
  #   'LVKitModule' => ['LVKitModule/Assets/*.png']
  # }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Masonry', '1.1.0'
  s.subspec 'Custom' do |ss|
      ss.public_header_files = 'LVKitModule/Classes/Custom/**/*.h'
      ss.source_files = 'LVKitModule/Classes/Custom/**/*.{h,m}'
  end

  s.subspec 'Category' do |ss|
      ss.public_header_files = 'LVKitModule/Classes/Category/**/*.h'
      ss.source_files = 'LVKitModule/Classes/Category/**/*'
  end
  
  s.subspec 'Route' do |ss|
      ss.public_header_files = 'LVKitModule/Classes/Route/**/*.h'
      ss.source_files = 'LVKitModule/Classes/Route/**/*'
  end
  
  s.subspec 'Request' do |ss|
      ss.public_header_files = 'LVKitModule/Classes/Request/**/*.h'
      ss.source_files = 'LVKitModule/Classes/Request/**/*'
  end
  
  s.subspec 'Debug' do |ss|
      ss.public_header_files = 'LVKitModule/Classes/Debug/**/*.h'
      ss.source_files = 'LVKitModule/Classes/Debug/**/*'
  end
  
  s.subspec 'Utils' do |ss|
      ss.public_header_files = 'LVKitModule/Classes/Utils/**/*.h'
      ss.source_files = 'LVKitModule/Classes/Utils/**/*'
  end
  
  s.subspec 'Const' do |ss|
      ss.public_header_files = 'LVKitModule/Classes/Const/**/*.h'
      ss.source_files = 'LVKitModule/Classes/Const/**/*'
  end
  
#  s.subspec 'Category' do |ss|
#      ss.public_header_files = 'LVKitModule/Classes/Category/**/*.h'
#      ss.source_files = 'LVKitModule/Classes/Category/**/*'
#  end
end
