//
//  YTKBaseRequest+WYReformer.m
//  WYReformerDemo
//
//  Created by iosci on 2016/12/23.
//  Copyright © 2016年 secoo. All rights reserved.
//

#import "YTKBaseRequest+WYReformer.h"

@implementation YTKBaseRequest (WYReformer)

- (id)fetchDataWithReformer:(id<WYReformerProtocol>)reformer {
  if (!reformer) {
    return [self responseJSONObject];
  }
  return [reformer reformerDataWithRequest:self];
}

@end
