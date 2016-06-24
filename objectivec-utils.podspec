#
# Be sure to run `pod lib lint objectivec-utils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
# When validating this pod use:
# >>> pod lib lint objectivec-utils.podspec --allow-warnings


Pod::Spec.new do |s|
  s.name             = "objectivec-utils"
  s.version          = "0.9.0"
  s.summary          = "Library of Objects for Math, Finance and Algorithms (work in progress)"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
Library of objects for Math, Finane and Algorithms.  Include Regression curves, Time value of money, and a set of collections.
                       DESC

  s.homepage         = "https://github.com/DLDBox/objectivec-utils"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "DDevoe" => "DLDBox-github@yahoo.com" }
  s.source           = { :git => "https://github.com/DLDBox/objectivec-utils.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.1'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'objectivec-utils' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'UIAlertController-MZStyle', '~> 1.0.0'
    s.dependency 'Flurry-iOS-SDK', '~> 7.5.2'
    
end
