//
//  WYBrandStoryRequest.m
//  WYReformerDemo
//
//  Created by iosci on 2016/12/23.
//  Copyright © 2016年 secoo. All rights reserved.
//

#import "WYBrandStoryRequest.h"

@implementation WYBrandStoryRequest {
  NSString *_brandId;
}

- (instancetype)initWithBrandId:(NSString *)brandId {
  self = [super init];
  if (self) {
    _brandId = brandId;
  }
  return self;
}

- (NSString *)baseUrl {
  return @"https://iphone.secoo.com";
}

- (NSString *)requestUrl {
  return @"/appservice/getBrandStory";
}

- (id)requestArgument {
  return @{
           @"brandId" : _brandId
           };
}

@end
