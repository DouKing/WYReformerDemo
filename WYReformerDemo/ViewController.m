//
//  ViewController.m
//  WYReformerDemo
//
//  Created by iosci on 2016/12/23.
//  Copyright © 2016年 secoo. All rights reserved.
//

#import "ViewController.h"
#import "WYBrandStoryRequest.h"
#import "WYBrandStoryReformer.h"
#import <UIImageView+WebCache.h>

@interface ViewController ()<YTKRequestDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *enNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cnName;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;

@property (nonatomic, strong) WYBrandStoryReformer *brandStoryReformer;
@property (nonatomic, strong) WYBrandStoryRequest *brandStoryRequest;

@end

@implementation ViewController

- (void)awakeFromNib {
  [super awakeFromNib];
  self.brandStoryRequest = [[WYBrandStoryRequest alloc] initWithBrandId:@"6"];
  self.brandStoryRequest.delegate = self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.brandStoryRequest start];
}

#pragma mark - Private Methods

- (void)_configData:(NSDictionary *)brandStory {
  [self.imageView sd_setImageWithURL:brandStory[kWYBrandStoryReformerLogoKey]];
  self.enNameLabel.text = brandStory[kWYBrandStoryReformerENNameKey];
  self.enNameLabel.text = brandStory[kWYBrandStoryReformerCNNameKey];
  self.descTextView.text = brandStory[kWYBrandStoryReformerDescKey];
}

#pragma mark - YTKRequestDelegate

- (void)requestFinished:(__kindof YTKBaseRequest *)request {
  NSLog(@"%s", __FUNCTION__);
  NSDictionary *brandStory = [request fetchDataWithReformer:self.brandStoryReformer];
  [self _configData:brandStory];
}

- (void)requestFailed:(__kindof YTKBaseRequest *)request {
  NSLog(@"%s", __FUNCTION__);
}

#pragma mark - setter & getter

- (WYBrandStoryReformer *)brandStoryReformer {
  if (!_brandStoryReformer) {
    _brandStoryReformer = [[WYBrandStoryReformer alloc] init];
  }
  return _brandStoryReformer;
}

@end
