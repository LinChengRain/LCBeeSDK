//
//  EmailServiceTool.m
//  LCRBeeSDK
//
//  Created by yuchanglin on 2018/6/14.
//  Copyright © 2018年 yuchanglin. All rights reserved.
//

#import "EmailServiceTool.h"
#import <SKPSMTPMessage.h>
#import <NSData+Base64Additions.h>

#define ToEmail @"yuchanglinlin@163.com"
#define FromEmail @"workermsg@163.com"
#define FromPassword @"ycl199295"
//#define FromEmail @"yucl@niudiapp.cn"
//#define FromPassword @"Ycl199295"

@interface EmailServiceTool ()<SKPSMTPMessageDelegate>


@end
static EmailServiceTool *instance = nil;
@implementation EmailServiceTool
+(instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ self alloc] init];
    });
    return instance;
}
- (void)sendEmail:(NSString *)sendMessage{
    SKPSMTPMessage *myMessage = [[SKPSMTPMessage alloc] init];
    myMessage.fromEmail = FromEmail;
    myMessage.toEmail = ToEmail;
//    myMessage.bccEmail = @"workermsg@163.com";//抄送 936656230@qq.com
    myMessage.relayHost = @"smtp.163.com";//smtp.exmail.qq.com
    myMessage.requiresAuth = YES;
    if (myMessage.requiresAuth) {
        myMessage.login = FromEmail;//发送者邮箱的用户名
        myMessage.pass = FromPassword;//发送者邮箱的密码
    }
    myMessage.wantsSecure = YES;//为gmail邮箱设置 smtp.gmail.com
    myMessage.subject = [NSString stringWithFormat:@"bug 上报"] ;//邮件主题
    myMessage.delegate = self;
    myMessage.connectTimeout = 30;
    //1.文字信息
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain; charset=UTF-8",kSKPSMTPPartContentTypeKey, self.filename ? @"crash日志，详情见附件":sendMessage,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
    myMessage.parts = [NSArray arrayWithObjects:plainPart,nil];
    
    //2.文件附件
    if (self.filename) {
        NSData *fileData = [NSData dataWithContentsOfFile:self.filename];
        NSDictionary *attached = [NSDictionary dictionaryWithObjectsAndKeys:@"text/directory;rntx-unix-mode=0644;rntname=\"log.txt\"",kSKPSMTPPartContentTypeKey, @"attachment;rntfilename=\"log.txt\"",kSKPSMTPPartContentDispositionKey,[fileData encodeBase64ForData],kSKPSMTPPartMessageKey,@"base64",kSKPSMTPPartContentTransferEncodingKey,nil];
        myMessage.parts = [NSArray arrayWithObjects:plainPart,attached,nil];
    }
    
    [myMessage send];
}

- (EmailServiceTool *)sendEmailForClass:(NSString *)sendMessage
{
    [self sendEmail:sendMessage];
    return [EmailServiceTool share];
}
#pragma mark - SKPSMTPMessageDelegate
- (void)messageSent:(SKPSMTPMessage *)message
{
    NSLog(@"发送成功");
    
    if (self.responseBlock) {
        self.responseBlock(YES);
    }
}
- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
    NSLog(@"message - %@\nerror - %@", message, error);

    if (self.responseBlock) {
        self.responseBlock(NO);
    }
}

@end
