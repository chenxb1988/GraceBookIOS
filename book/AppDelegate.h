//
//  AppDelegate.h
//  book
//
//  Created by chenxb on 17/1/16.
//  Copyright © 2017年 grace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

+(AppDelegate *)shareInstance;


@end

