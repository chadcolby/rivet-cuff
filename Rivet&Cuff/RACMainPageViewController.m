//
//  RACMainPageViewController.m
//  Rivet&Cuff
//
//  Created by Chad D Colby on 7/17/14.
//  Copyright (c) 2014 Byte Meets World. All rights reserved.
//

#import "RACMainPageViewController.h"
#import "RACMenuCell.h"

@interface RACMainPageViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) NSArray *imageData;


@end

@implementation RACMainPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    [self.collectionView registerClass:[RACMenuCell class] forCellWithReuseIdentifier:@"menuCell"];
    self.collectionView.backgroundColor =[UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.data = [NSArray arrayWithObjects:@"About", @"Upload", @"Denim 101", @"Visit Us", @"Full Site", nil];
    self.imageData = [NSArray arrayWithObjects:@"about", @"upload", @"denim101", @"visitUs", @"web", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%lu", (unsigned long)self.data.count);
    return self.data.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RACMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"menuCell" forIndexPath:indexPath];
    cell.label.text = self.data[indexPath.item];
    cell.iconImage.image = [UIImage imageNamed:self.imageData[indexPath.item]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
