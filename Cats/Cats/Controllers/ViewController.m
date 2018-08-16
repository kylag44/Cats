//
//  ViewController.m
//  Cats
//
//  Created by Kyla  on 2018-08-16.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"




@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic) NSArray<Cat *> *objects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _objects = [@[] mutableCopy];
    NSLog(@"Getting cats");
    [Photo getPhotos:^(NSMutableArray *cats) {
        self.objects = cats;
        NSLog(@"view controller got data: %@", self.objects);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];
    NSLog(@"method finished");
}

////////layout stuff
//-(void)viewWillLayoutSubviews {
//    /////////make an instance of layout
//    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
//    /////have the layout pin the header
//    layout.sectionHeadersPinToVisibleBounds = YES;
//    CGSize size = CGSizeMake(self.collectionView.bounds.size.width/3, self.collectionView.bounds.size.width/3);
//    layout.itemSize = size;
//}

/////delegats
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.objects.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.objects.count;

}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
 
    return cell;
}







@end
