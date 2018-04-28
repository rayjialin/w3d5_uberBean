//
//  Cafe.m
//  UberBean
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "Cafe.h"

@implementation Cafe

-(id _Nullable)initWithCoordinate:(CLLocationCoordinate2D)cafeCoordinate andTitle:(NSString * _Nullable)title andRating:(NSString * _Nullable)rating{
    self = [super init];
    if (self) {
        _coordinate = cafeCoordinate;
        _title = title;
        _cafeImageName = [NSString new];
        _subtitle = rating;
        
    }
    return self;
}

@end
