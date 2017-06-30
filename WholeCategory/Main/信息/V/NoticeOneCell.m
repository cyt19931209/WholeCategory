//
//  NoticeOneCell.m
//  奢易购3.0
//
//  Created by Andy on 2016/12/13.
//  Copyright © 2016年 cyt. All rights reserved.
//

#import "NoticeOneCell.h"

@implementation NoticeOneCell



- (void)setDic:(NSDictionary *)dic{

    _dic = dic;
    
    _titleLabel.text = _dic[@"title"];
//    _MSLabel.text = _dic[@"description"];
    _timeLabel.text = _dic[@"add_time"];
    
    [_imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",imgUrl,_dic[@"pic"]]]];

    NSString * htmlString = _dic[@"content"];
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    _MSLabel.attributedText = attrStr;
    
    
    if ([_dic[@"is_read"] isEqualToString:@"1"]) {
        _readLabel.textColor = [RGBColor colorWithHexString:@"#999999"];
        _readLabel.text = @"已读";
    }else{
        _readLabel.textColor = [RGBColor colorWithHexString:@"#949dff"];
        _readLabel.text = @"未读";
    }
    

}



@end
