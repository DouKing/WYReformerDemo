//
//  WYBrandStoryRequest.h
//  WYReformerDemo
//
//  Created by iosci on 2016/12/23.
//  Copyright © 2016年 secoo. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN


@interface WYBrandStoryRequest : YTKRequest

- (instancetype)initWithBrandId:(nonnull NSString *)brandId;

@end


NS_ASSUME_NONNULL_END
