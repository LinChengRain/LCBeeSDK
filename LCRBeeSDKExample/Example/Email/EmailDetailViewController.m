//
//  EmailDetailViewController.m
//  ServiceCustomTools
//
//  Created by yu changlin on 2018/6/19.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

#import "EmailDetailViewController.h"
#import "EmailServiceTool.h"
#import "MBProgressHUD+Extension.h"
#import <MessageUI/MessageUI.h>

#define ToEmail @"yuchanglinlin@163.com"
#define FromEmail @"workermsg@163.com"
#define FromPassword @"ycl199295"

@interface EmailDetailViewController ()<MFMailComposeViewControllerDelegate>
@property (nonatomic,strong) UITextView *textView;
@end

@implementation EmailDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];

    [self addView];
}
- (void)addView{
    [self.view addSubview:self.textView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 200,  [UIScreen mainScreen].bounds.size.width - 100, 35);
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sendEmailAction) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor greenColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (UITextView *)textView{
    if (_textView == nil) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width - 40, 50)];
        _textView.textColor = [UIColor redColor];
    }
    return _textView;
}
- (void)sendEmailAction{
    switch (self.index) {
        case 0:
            [self sendEmailOfSystemOne];
            break;
        case 1:
            [self sendEmailOfSystemTwo];
            
            break;
        case 2:
            [self sendEmails];
            break;
        default:
            break;
    }
}
#pragma mark ========== 系统方法发送邮件1 ==========
- (void)sendEmailOfSystemOne{
    //创建可变的地址字符串对象
    NSMutableString *mailUrl = [[NSMutableString alloc] init];
    //添加收件人,如有多个收件人，可以使用componentsJoinedByString方法连接，连接符为","
    NSString *recipients = ToEmail;
    [mailUrl appendFormat:@"mailto:%@?", recipients];
//    //添加抄送人
//    NSString *ccRecipients = @"1622849369@qq.com";
//    [mailUrl appendFormat:@"&cc=%@", ccRecipients];
//    //添加密送人
//    NSString *bccRecipients = @"15690725786@163.com";
//    [mailUrl appendFormat:@"&bcc=%@", bccRecipients];
    //添加邮件主题
    [mailUrl appendFormat:@"&subject=%@",@"系统方法发送邮件1 测试"];
    //添加邮件内容
    [mailUrl appendString:[NSString stringWithFormat:@"&body=<b>系统方法发送邮件1 \n %@</b>",self.textView.text]];
    //跳转到系统邮件App发送邮件
    NSString *emailPath = [mailUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:emailPath] options:@{} completionHandler:nil];
}
#pragma mark ========== 系统方法发送邮件2 ==========
//激活邮件功能
- (void)sendEmailOfSystemTwo
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if (!mailClass) {
        [MBProgressHUD showText:@"当前系统版本不支持应用内发送邮件功能，您可以使用mailto方法代替" view:nil];
        return;
    }
    if (![mailClass canSendMail]) {
        [MBProgressHUD showText:@"用户没有设置邮件账户" view:nil];
        return;
    }
    [self displayMailPicker];
}

//调出邮件发送窗口
- (void)displayMailPicker
{
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    mailPicker.mailComposeDelegate = self;
    
    //设置主题
    [mailPicker setSubject: @"eMail主题"];
    //添加收件人
    NSArray *toRecipients = [NSArray arrayWithObject: ToEmail];
    [mailPicker setToRecipients: toRecipients];
    //    //添加抄送
    //    NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil];
    //    [mailPicker setCcRecipients:ccRecipients];
    //    //添加密送
    //    NSArray *bccRecipients = [NSArray arrayWithObjects:@"fourth@example.com", nil];
    //    [mailPicker setBccRecipients:bccRecipients];
    //
    // 添加一张图片
    //    UIImage *addPic = [UIImage imageNamed: @"Icon@2x.png"];
    //    NSData *imageData = UIImagePNGRepresentation(addPic);            // png
    //    //关于mimeType：http://www.iana.org/assignments/media-types/index.html
    //    [mailPicker addAttachmentData: imageData mimeType: @"" fileName: @"Icon.png"];
    
    //    //添加一个pdf附件
    //    NSString *file = [self fullBundlePathFromRelativePath:@"高质量C++编程指南.pdf"];
    //    NSData *pdf = [NSData dataWithContentsOfFile:file];
    //    [mailPicker addAttachmentData: pdf mimeType: @"" fileName: @"高质量C++编程指南.pdf"];
    
    NSString *emailBody = [NSString stringWithFormat:@"&body=<b>系统方法发送邮件2 \n %@</b>",self.textView.text];
    [mailPicker setMessageBody:emailBody isHTML:YES];
    [self presentViewController:mailPicker animated:YES completion:nil];
}

#pragma mark - 实现 MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    //关闭邮件发送窗口
    [self dismissViewControllerAnimated:YES completion:nil];
    NSString *msg;
    switch (result) {
        case MFMailComposeResultCancelled:
            msg = @"用户取消编辑邮件";
            break;
        case MFMailComposeResultSaved:
            msg = @"用户成功保存邮件";
            break;
        case MFMailComposeResultSent:
            msg = @"用户点击发送，将邮件放到队列中，还没发送";
            break;
        case MFMailComposeResultFailed:
            msg = @"用户试图保存或者发送邮件失败";
            break;
        default:
            msg = @"";
            break;
    }
    [MBProgressHUD showText:msg view:nil];
}

#pragma mark ========== 第三方发送邮件 ==========
- (void)sendEmails{
    if (self.textView.text.length > 0) {
        NSString * logStr = self.textView.text;
        [[[EmailServiceTool share] sendEmailForClass:logStr] setResponseBlock:^(BOOL status) {
            NSLog(@"发送成功");
            [MBProgressHUD showSuccess:@"发送成功"];
        }];
    }
}

/*
 - (void)sendEmail{
 // 发送崩溃日志
 
 NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
 
 NSString *dataPath = [path stringByAppendingPathComponent:@"AppLog/log.txt"];
 
 NSData *data = [NSData dataWithContentsOfFile:dataPath];
 
 if (data != nil) {
 NSString * logStr = [NSString stringWithContentsOfFile:dataPath encoding:NSUTF8StringEncoding error:nil];
 
 [EmailServiceTool share].filename = dataPath;
 [[[EmailServiceTool share] sendEmailForClass:logStr] setResponseBlock:^(BOOL status) {
 
 }];
 }
 }
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
