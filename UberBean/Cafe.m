//
//  Cafe.m
//  UberBean
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "Cafe.h"

@implementation Cafe

//-(instancetype)initWithDictionary:(NSDictionary *)cafeDict{
//    self = [super init];
//    if (self) {
//        _cafeTitle = cafeDict[@"name"];
//        _cafeImageName = cafeDict[@"image_url"];
//        _cafeLatitude = cafeDict[@"coordinates"][@"latitude"];
//        _cafeLongitude = cafeDict[@"coordinates"][@"longitude"];
//        _cafeRating = cafeDict[@"rating"];
//
//    }
//    return self;
//}

-(id _Nullable)initWithCoordinate:(CLLocationCoordinate2D)cafeCoordinate andTitle:(NSString * _Nullable)title andImage:(NSString * _Nullable)image andRating:(NSString * _Nullable)rating{
    self = [super init];
    if (self) {
        _coordinate = cafeCoordinate;
        _cafeTitle = title;
        _cafeImageName = image;
        _cafeRating = rating;
        
    }
    
    
    return self;
}

@end
