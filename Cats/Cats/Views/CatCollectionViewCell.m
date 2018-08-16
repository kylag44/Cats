//
//  CatCollectionViewCell.m
//  Cats
//
//  Created by Kyla  on 2018-08-16.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "CatCollectionViewCell.h"

#import "Cat.h"

@interface CatCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation CatCollectionViewCell


-(void)setCat:(Cat *)cat {
    
    self.imageView.image = cat.imageCat;
    self.label.text = cat.name;
    
}

@end


