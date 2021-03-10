#
# Be sure to run `pod lib lint ELUnionPayment.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ELUnionPayment'
  s.version          = '1.0.0'
  s.summary          = '聚合支付（翼支付、建行、银联）'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
通用支付SDK整合，目前包括翼支付、建行、银联
                       DESC

  s.homepage         = 'https://github.com/elear218/ELUnionPayment'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'elear218@qq.com' => 'liujuebo@mankebao.com' }
  s.source           = { :git => 'https://github.com/elear218/ELUnionPayment.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  
  s.subspec 'Bestpay' do |ss|
      ss.source_files = 'ELUnionPayment/Classes/Bestpay/*.{h,m}'
      ss.vendored_libraries = 'ELUnionPayment/Classes/Bestpay/**/*.{a}'
      ss.resource_bundles = {
        'Bestpay' => ['ELUnionPayment/Assets/Bestpay/*.png', 'ELUnionPayment/Assets/Bestpay/*.html', 'ELUnionPayment/Assets/Bestpay/*.bundle']
      }
      ss.subspec 'openssl' do |sss|
          sss.source_files = 'ELUnionPayment/Assets/Bestpay/openssl/*.{h}'
      end
      ss.frameworks = 'Foundation', 'UIKit', 'AudioToolbox', 'CoreGraphics', 'QuartzCore', 'SystemConfiguration', 'CFNetwork'
      ss.libraries = 'stdc++', 'sqlite3'
  end
  
  s.subspec 'CCB' do |ss|
      ss.vendored_frameworks = 'ELUnionPayment/Classes/CCB/*.framework'
      ss.vendored_libraries = 'ELUnionPayment/Classes/CCB/*.a'
      ss.frameworks = 'Foundation', 'UIKit', 'CoreTelephony', 'Security', 'SystemConfiguration', 'CFNetwork'
      ss.libraries = 'c++', 'sqlite3', 'z'
  end
  
  s.subspec 'UP' do |ss|
      ss.source_files = 'ELUnionPayment/Classes/UP/*.{h,m}'
      ss.vendored_libraries = 'ELUnionPayment/Classes/UP/*.a'
  end
  
  # s.resource_bundles = {
  #   'ELUnionPayment' => ['ELUnionPayment/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
