//
//  AppDelegate.m
//  MeiYuanProject
//
//  Created by 约牛 on 2021/8/4.
//

#import "AppDelegate.h"
#import "LZBBaseTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    [self addKeyboardManager];
    [self entryMainVC];
    // Override point for customization after application launch.
    return YES;
}


#pragma mark - KeyboardManager
- (void)addKeyboardManager {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = NO;
    manager.toolbarTintColor = [UIColor redColor];
    //是否显示工具条
    manager.enableAutoToolbar = YES;
    [manager setToolbarManageBehaviour:IQAutoToolbarByPosition];
}

- (void)entryMainVC {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LZBBaseTabBarController *view = [storyboard instantiateViewControllerWithIdentifier:@"LZBBaseTabBarController"];
    self.window.rootViewController = view;
}

// MARK: - 全局 禁用第三方键盘
- (BOOL)application:(UIApplication *)application shouldAllowExtensionPointIdentifier:(UIApplicationExtensionPointIdentifier)extensionPointIdentifier {
    // 1. UIApplicationKeyboardExtensionPointIdentifier
    // 2. @"com.apple.keyboard-service"
    // 应该是一样的
    if ([extensionPointIdentifier isEqualToString:UIApplicationKeyboardExtensionPointIdentifier] )
        return NO;
    return YES;
}
@end
