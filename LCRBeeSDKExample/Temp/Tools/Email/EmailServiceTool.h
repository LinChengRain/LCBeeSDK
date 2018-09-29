//
//  EmailServiceTool.h
//  ServiceCustomTools
//
//  Created by gz on 2018/6/14.
//  Copyright © 2018年 yu changlin. All rights reserved.
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


