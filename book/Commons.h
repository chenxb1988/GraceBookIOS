//
//  Commons.h
//  book
//
//  Created by chenxb on 17/1/16.
//  Copyright © 2017年 grace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Commons : NSObject
//屏幕可用尺寸
#define ScreenHeight ([UIScreen mainScreen].applicationFrame.size.height)
#define ScreenWidth  ([UIScreen mainScreen].applicationFrame.size.width)


//全幕尺寸
#define YQ_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define YQ_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define ThemeDidChangeNotification @"ThemeDidChangeNotification"
#define THEME_COLOR @"theme_color"

#define UserDefault [NSUserDefaults standardUserDefaults]

@end
