//
//  Photo.h
//  Cats
//
//  Created by Kyla  on 2018-08-16.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"

@interface Photo : NSObject





+ (void)getPhotos:(void (^)(NSMutableArray *))completion;


@end
