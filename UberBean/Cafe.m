//
//  Cafe.m
//  UberBean
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "Cafe.h"

@implementation Cafe

-(instancetype)initWithDictionary:(NSDictionary *)cafeDict{
    self = [super init];
    if (self) {
        _cafeTitle = cafeDict[@"name"];
        _cafeImageName = cafeDict[@"image_url"];
        _cafeLatitude = cafeDict[@"coordinates"][@"latitude"];
        _cafeLongitude = cafeDict[@"coordinates"][@"longitude"];
        _cafeRating = cafeDict[@"rating"];

    }
    return self;
}

@end
