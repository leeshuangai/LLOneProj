
Pod::Spec.new do |s|
s.name         = "LLOneProj" # 项目名称
s.version      = "0.0.3"        # 版本号 与 你仓库的 标签号 对应
s.license      = "MIT"          # 开源证书
s.summary      = "私人pod代码" # 项目简介

s.homepage     = "https://github.com/leeshuangai/LLOneProj" # 仓库的主页
s.source       = { :git => "https://github.com/leeshuangai/LLOneProj.git", :tag => "#{s.version}" }#你的仓库地址，不能用SSH地址
s.source_files = 'LLOneProj/Classes/**/*'
s.requires_arc = true # 是否启用ARC
s.platform     = :ios, "8.0" #平台及支持的最低版本
# s.frameworks   = "UIKit", "Foundation" #支持的框架
# s.dependency   = "AFNetworking" # 依赖库

# User
s.author           = { 'leeshuangai' => 'lishuang@51xl.com' } # 作者信息
end

