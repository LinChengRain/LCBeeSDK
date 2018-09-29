//
//  EmailServiceTool.h
//  LCRBeeSDK
//
//  Created by yuchanglin on 2018/6/14.
//  Copyright © 2018年 yuchanglin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ResponseBlock)(BOOL status);

@interface EmailServiceTool : NSObject

+ (instancetype )share;
@property (nonatomic,copy) ResponseBlock responseBlock;
@property (nonatomic,copy) NSString * filename;

- (void)sendEmail:(NSString *)sendMessage;
- (EmailServiceTool *)sendEmailForClass:(NSString *)sendMessage;
@end


