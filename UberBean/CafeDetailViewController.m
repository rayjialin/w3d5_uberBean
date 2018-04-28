//
//  CafeDetailViewController.m
//  UberBean
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "CafeDetailViewController.h"
#import "NetworkManager.h"

@interface CafeDetailViewController ()

//@property (nonatomic) NetworkManager *networkManager;
@end

@implementation CafeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cafeImageView = [UIImageView new];
    self.cafeTitle = [UILabel new];
    self.cafeSubtitle = [UILabel new];
    
    self.cafeImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.cafeTitle.text = self.cafeAnnotation.title;
    self.cafeTitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.cafeTitle.textAlignment = NSTextAlignmentCenter;
    self.cafeSubtitle.text = self.cafeAnnotation.subtitle;
    self.cafeSubtitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.cafeSubtitle.textAlignment = NSTextAlignmentCenter;
    
    NetworkManager *networkManager = [NetworkManager new];
    [networkManager processImageDownload:self.cafeAnnotation.cafeImageName completion:^(UIImage *image) {
        self.cafeImageView.image = image;
        
    }];
    
    [self.view addSubview:self.cafeImageView];
    [self.view addSubview:self.cafeTitle];
    [self.view addSubview:self.cafeSubtitle];
    
    [self setupView];
}

-(void)setupView{
    
    [self.cafeImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:60].active = YES;
    [self.cafeImageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [self.cafeImageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.5].active = YES;
    
    [self.cafeTitle.topAnchor constraintEqualToAnchor:self.cafeImageView.bottomAnchor constant:20].active = YES;
    [self.cafeTitle.widthAnchor constraintEqualToAnchor:self.cafeImageView.widthAnchor].active = YES;
    [self.cafeTitle.heightAnchor constraintEqualToAnchor:self.cafeImageView.heightAnchor multiplier:0.1].active = YES;
    
    [self.cafeSubtitle.topAnchor constraintEqualToAnchor:self.cafeTitle.bottomAnchor].active = YES;
    [self.cafeSubtitle.widthAnchor constraintEqualToAnchor:self.cafeTitle.widthAnchor].active = YES;
    [self.cafeSubtitle.heightAnchor constraintEqualToAnchor:self.cafeImageView.heightAnchor multiplier:0.2].active = YES;

}

@end
