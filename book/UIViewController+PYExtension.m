//
//  UIViewController+PYExtension.m
//  book
//
//  Created by chenxb on 17/1/20.
//  Copyright © 2017年 grace. All rights reserved.
//

#import "UIViewController+PYExtension.h"
#import "Commons.h"

@implementation UIViewController (PYExtension)



-(void)addNotification{
    if (self) {
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(themeNotification:)
         name:ThemeDidChangeNotification object:nil];
    }
}

- (void)themeNotification:(NSNotification *)notification {
    if(notification.object && [notification.object isKindOfClass:[UIColor class]]){
        UIColor *color = notification.object;
        [self changeTheme:color];
    }
}

@end
