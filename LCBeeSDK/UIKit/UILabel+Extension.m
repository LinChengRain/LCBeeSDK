//
//  UILabel+VerticalAlign.h
//  MamiHomeApp
//
//  Created by Changlin Yu on 2017/8/12.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

@end
@implementation UILabel (VerticalAlign)

- (void) alignTop
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13.f], NSParagraphStyleAttributeName:paragraphStyle.copy};
    float width = self.frame.size.width;
    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(width, 50) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGRect dateFrame =CGRectMake(self.frame.origin.x, self.frame.origin.y, CGRectGetWidth(self.frame), labelSize.height);
    self.frame = dateFrame;
}
@end
