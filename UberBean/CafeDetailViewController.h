//
//  CafeDetailViewController.h
//  UberBean
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cafe.h"

@interface CafeDetailViewController : UIViewController

@property (nonatomic) UIImageView *cafeImageView;
@property (nonatomic) UILabel *cafeTitle;
@property (nonatomic) UILabel *cafeSubtitle;
@property (nonatomic) Cafe *cafeAnnotation;
@end
