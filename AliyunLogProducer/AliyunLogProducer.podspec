#
# Be sure to run `pod lib lint AliyunLogProducer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AliyunLogProducer'
  s.version          = '2.2.26'
  s.summary          = 'aliyun log service ios producer.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
log service ios producer.
https://help.aliyun.com/document_detail/29063.html
https://help.aliyun.com/product/28958.html
                       DESC

  s.homepage         = 'https://github.com/aliyun/aliyun-log-ios-sdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aliyun-log' => 'davidzhang.zc@alibaba-inc.com' }
  s.source           = { :git => 'https://github.com/aliyun/aliyun-log-ios-sdk.git', :tag => s.version.to_s }
  s.social_media_url = 'http://t.cn/AiRpol8C'

  s.ios.deployment_target = '8.0'
  s.default_subspec = 'Core'

  s.requires_arc  = true
  s.libraries = 'z'
  
  s.subspec 'Core' do |c|
      c.source_files =
          'AliyunLogProducer/*.{h,m}',
          'aliyun-log-c-sdk/src/*.{c,h}',
          'AliyunLogProducer/utils/*.{m,h}'
      
      c.public_header_files =
          'AliyunLogProducer/*.h',
          'AliyunLogProducer/utils/*.h',
          '**/*/src/log_define.h',
          '**/*/src/log_http_interface.h',
          '**/*/src/log_inner_include.h',
          '**/*/src/log_multi_thread.h',
          '**/*/src/log_producer_client.h',
          '**/*/src/log_producer_common.h',
          '**/*/src/log_producer_config.h'
  end
  
  s.subspec 'Bricks' do |b|
      b.dependency 'AliyunLogProducer/Core'
      b.source_files =
      'AliyunLogProducer/common/**/*.{m,h}',
      'AliyunLogProducer/common/**/*.{m,h}',
      'AliyunLogProducer/common/**/*.{m,h}',
      'AliyunLogProducer/common/**/*.{m,h}'
      b.public_header_files =
      'AliyunLogProducer/common/**/*.h',
      'AliyunLogProducer/common/**/*.h',
      'AliyunLogProducer/common/**/*.h',
      'AliyunLogProducer/common/**/*.h'
      b.frameworks = "SystemConfiguration"
  end
  
  s.subspec 'CrashReporter' do |c|
      c.dependency 'AliyunLogProducer/Bricks'
      c.source_files = 'AliyunLogProducer/CrashReporter/**/*.{m,h}'
      c.vendored_frameworks = 'AliyunLogProducer/CrashReporter/WPKMobi.framework'
      c.frameworks = "SystemConfiguration", "CoreGraphics"
      c.libraries = "z", "c++"
      c.pod_target_xcconfig = {
          'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
          'OTHER_LDFLAGS' => '-ObjC'
      }
      c.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  end
  
end
