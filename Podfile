platform :ios, '9.0'

inhibit_all_warnings!         #禁止所有警告

target 'MeiYuanProject' do
    pod 'MJRefresh'
    pod 'MJExtension'
    pod 'MBProgressHUD'
    pod 'SDWebImage'
    pod 'Masonry'
    pod 'AFNetworking'
    pod 'DZNEmptyDataSet'
    pod 'IQKeyboardManager'
    pod 'YYCache'
end

#消除第三方库最低版本的警告，对第三方库进行了判断若DEPLOYMENT_TARGET<9.0就会切换成9.0
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 9.0
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
            end
        end
    end
end
