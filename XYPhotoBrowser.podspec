#
# Be sure to run `pod lib lint XYPhotoBrowser.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XYPhotoBrowser'
  s.version          = '1.0.2'
  s.summary          = 'PhotoBrowser'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'PhotoBrowser  is an image browser , it supports 3D-Touch , rotating the screen , zooming images , Drag to disappear'
                       DESC

  s.homepage         = 'https://github.com/gdutxzy/XYPhotoBrowser'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gdutxzy' => 'gdutxzy@163.com' }
  s.source           = { :git => 'https://github.com/gdutxzy/XYPhotoBrowser.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'XYPhotoBrowser/**/*'

  # s.resource_bundles = {
  #   'XYPhotoBrowser' => ['XYPhotoBrowser/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'SDWebImage'
end
