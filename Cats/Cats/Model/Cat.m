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
        _link = info[@"link"];
        _name = info[@"name"];
    }
    return self;
}


@end
