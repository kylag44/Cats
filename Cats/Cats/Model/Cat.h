//
//  Cat.h
//  Cats
//
//  Created by Kyla  on 2018-08-16.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cat : NSObject


@property (nonatomic,strong) NSString *link;
@property (nonatomic, strong) NSString *name; 

- (instancetype)initWithInfo:(NSDictionary *)info;

@end
