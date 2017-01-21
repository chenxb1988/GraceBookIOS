//
//  BaseModel.h
//  book
//
//  Created by chenxb on 17/1/21.
//  Copyright © 2017年 grace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface BaseModel : JSONModel

@property (nonatomic) int ret;
@property (nonatomic) NSString *msg;

@end
