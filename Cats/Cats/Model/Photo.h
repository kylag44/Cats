//
//  Photo.h
//  Cats
//
//  Created by Kyla  on 2018-08-16.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"
@import UIKit;

@interface Photo : NSObject

@property (nonatomic) NSURL *urlPhoto;
@property (nonatomic) NSString *namePhoto;
@property (nonatomic) UIImage *image; 




+ (void)getPhotos:(void (^)(NSMutableArray *))completion;


@end
