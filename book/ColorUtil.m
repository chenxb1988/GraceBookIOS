//
//  ColorUtil.m
//  book
//
//  Created by chenxb on 17/1/19.
//  Copyright © 2017年 grace. All rights reserved.
//

#import "ColorUtil.h"
#import "Commons.h"

@implementation ColorUtil

+ (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (void) saveThemeColor: (UIColor*) color
{
    CGColorRef textColorRef = color.CGColor;
    NSString *textColorStr = [CIColor colorWithCGColor:textColorRef].stringRepresentation;
    [UserDefault setObject:textColorStr forKey:THEME_COLOR];
}

+ (UIColor*) getThemeColor
{
    NSString *colorStr = [UserDefault objectForKey:THEME_COLOR];
    if(!colorStr){
        return [UIColor blueColor];
    }
    
    NSArray *colorArray = [colorStr componentsSeparatedByString:@" "];
    CGFloat red = [[colorArray objectAtIndex:0] floatValue];
    CGFloat green = [[colorArray objectAtIndex:1] floatValue];
    CGFloat blue = [[colorArray objectAtIndex:2] floatValue];
    CGFloat alpha = [[colorArray objectAtIndex:3] floatValue];
    
    UIColor *color = [[UIColor alloc]initWithRed:red green:green blue:blue alpha:alpha];
    return color;
}
@end
