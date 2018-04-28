//
//  Cafe.h
//  UberBean
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface Cafe : NSObject <MKAnnotation>

@property (nonatomic, nullable, readonly, copy) NSString *cafeTitle;
@property (nonatomic, nullable, readonly, copy) NSString *cafeImageName;
//@property (nonatomic) NSString *cafeLatitude;
//@property (nonatomic) NSString *cafeLongitude;
@property (nonatomic, nullable, readonly, copy) NSString *cafeRating;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
//-(instancetype)initWithDictionary:(NSDictionary *)cafeDict;
-(id _Nullable)initWithCoordinate:(CLLocationCoordinate2D)cafeCoordinate andTitle:(NSString * _Nullable)title andImage:(NSString * _Nullable)image andRating:(NSString * _Nullable)rating;
@end
