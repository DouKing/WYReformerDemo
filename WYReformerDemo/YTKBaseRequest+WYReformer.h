//
//  YTKBaseRequest+WYReformer.h
//  WYReformerDemo
//
//  Created by iosci on 2016/12/23.
//  Copyright © 2016年 secoo. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
NS_ASSUME_NONNULL_BEGIN

@protocol WYReformerProtocol <NSObject>

- (id)reformerDataWithRequest:(nonnull __kindof YTKBaseRequest *)request;

@end

@interface YTKBaseRequest (WYReformer)

- (id)fetchDataWithReformer:(id<WYReformerProtocol>)reformer;

@end


NS_ASSUME_NONNULL_END
