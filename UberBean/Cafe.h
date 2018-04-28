//
//  Cafe.h
//  UberBean
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface Cafe : NSObject

@property (nonatomic) NSString *cafeTitle;
@property (nonatomic) NSString *cafeImageName;
@property (nonatomic) NSString *cafeLatitude;
@property (nonatomic) NSString *cafeLongitude;
@property (nonatomic) NSString *cafeRating;
-(instancetype)initWithDictionary:(NSDictionary *)cafeDict;
@end
