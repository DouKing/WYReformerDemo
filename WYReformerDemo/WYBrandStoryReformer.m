//
//  WYBrandStoryReformer.m
//  WYReformerDemo
//
//  Created by iosci on 2016/12/23.
//  Copyright © 2016年 secoo. All rights reserved.
//

#import "WYBrandStoryReformer.h"

NSString * const kWYBrandStoryReformerENNameKey = @"kWYBrandStoryReformerENNameKey";
NSString * const kWYBrandStoryReformerCNNameKey = @"kWYBrandStoryReformerCNNameKey";
NSString * const kWYBrandStoryReformerLogoKey = @"kWYBrandStoryReformerLogoKey";
NSString * const kWYBrandStoryReformerDescKey = @"kWYBrandStoryReformerDescKey";

@implementation WYBrandStoryReformer

- (id)reformerDataWithRequest:(__kindof YTKBaseRequest *)request {
  if (!request) {
    return nil;
  }
  NSAssert(YTKResponseSerializerTypeJSON == [request responseSerializerType], @"❌ 哥们儿，数据格式不对吧");
  NSDictionary *rowInfo = [request responseJSONObject];
  if (![rowInfo isKindOfClass:[NSDictionary class]]) {
    return nil;
  }
  rowInfo = rowInfo[@"rp_result"];
  if ([rowInfo[@"recode"] intValue] != 0) {
    return nil;
  }
  return @{
           kWYBrandStoryReformerCNNameKey : rowInfo[@"enName"],
           kWYBrandStoryReformerENNameKey : rowInfo[@"chName"],
           kWYBrandStoryReformerLogoKey : [NSURL URLWithString:rowInfo[@"brandLogoUrl"] ?: @""],
           kWYBrandStoryReformerDescKey : rowInfo[@"brandDesc"]
           };
}

@end
