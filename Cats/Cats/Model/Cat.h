//
//  Cat.h
//  Cats
//
//  Created by Kyla  on 2018-08-16.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "Photo.h"
@interface Cat : NSObject


@property (nonatomic,strong) NSString *link;
@property (nonatomic, strong) NSString *name; 
@property (nonatomic) NSURL *urlCat;
@property (nonatomic) NSString *nameCat;
@property (nonatomic) UIImage *imageCat;
@property (nonatomic) NSString *dataCat;


- (instancetype)initWithInfo:(NSDictionary *)info;

@end
