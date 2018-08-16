//
//  CatCollectionViewCell.h
//  Cats
//
//  Created by Kyla  on 2018-08-16.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <UIKit/UIKit.h>


@class Cat;

@interface CatCollectionViewCell : UICollectionViewCell





@property (nonatomic)Cat *cat;



-(void)setCat:(Cat *)cat;
@end


