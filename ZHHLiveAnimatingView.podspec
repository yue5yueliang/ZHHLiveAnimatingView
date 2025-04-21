Pod::Spec.new do |s|
  s.name             = 'ZHHLiveAnimatingView'
  s.version          = '0.0.1'
  s.summary          = '一个用于展示正在直播状态的动画视图组件。'

  s.description      = <<-DESC
ZHHLiveAnimatingView 是一个轻量级、可定制的视图组件，用于展示「正在直播」的视觉效果，例如直播中波纹动画、脉冲动画等。
该组件适用于直播类 App、语音房、视频通话等场景，用于指示当前用户正在直播或说话状态。
支持多种动画样式、可配置的颜色与大小，并支持灵活嵌入任意 UIView 结构中。
                       DESC

  s.homepage         = 'https://github.com/yue5yueliang/ZHHLiveAnimatingView'
  # s.screenshots     = 'https://example.com/screenshot1.png', 'https://example.com/screenshot2.png'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '桃色三岁' => '136769890@qq.com' }
  s.source           = {
    :git => 'https://github.com/yue5yueliang/ZHHLiveAnimatingView.git',
    :tag => s.version.to_s
  }

  s.ios.deployment_target = '13.0'
  s.default_subspec       = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'ZHHLiveAnimatingView/Classes/**/*'
    # 如果需要添加资源或依赖，可取消以下注释
    # core.resources = ['ZHHLiveAnimatingView/Assets/*.xcassets']
    # core.dependency 'SomeDependency'
  end

  # 如果需要资源打包，可启用以下配置
  # s.resource_bundles = {
  #   'ZHHLiveAnimatingView' => ['ZHHLiveAnimatingView/Assets/*.png']
  # }

  # s.public_header_files = 'ZHHLiveAnimatingView/Classes/**/*.h'
  # s.frameworks = 'UIKit'
end
