//
//  Cat.m
//  Cats
//
//  Created by Kyla  on 2018-08-16.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "Cat.h"

@implementation Cat


- (instancetype)initWithInfo:(NSDictionary *)info
{
    self = [super init];
    if (self) {
  
        _link = info[@"images"][0][@"link"];
        _name = info[@"title"];
        _dataCat = info[@"dataCat"];
        _imageCat = nil;
        ////call self download so it initializes the image for me
        [self download];
    }
    return self;
}


-(void)download{
   
    NSString *urlString = [NSString stringWithFormat:@"%@", self.link];
    _urlCat = [[NSURL alloc] initWithString:urlString];
    
    if (self.imageCat == nil) {
       NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
        NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:self.urlCat completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {

    NSData *data = [NSData dataWithContentsOfURL:location];
    UIImage *image = [UIImage imageWithData:data];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.imageCat = image;
   
    }];
}];

[downloadTask resume];
}
}
@end
