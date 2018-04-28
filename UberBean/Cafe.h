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

@property (nonatomic, nullable, readonly, copy) NSString *title;
@property (nonatomic, nullable) NSString *cafeImageName;
@property (nonatomic, nullable, readonly, copy) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
-(id _Nullable)initWithCoordinate:(CLLocationCoordinate2D)cafeCoordinate andTitle:(NSString * _Nullable)title andRating:(NSString * _Nullable)rating;
@end
