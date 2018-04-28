//
//  ViewController.m
//  UberBean
//
//  Created by ruijia lin on 4/27/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "ViewController.h"
#import "Cafe.h"
#import "NetworkManager.h"

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *location;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
//@property (nonatomic) NetworkManager *networkManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.locationManager.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    self.locationManager = [CLLocationManager new];
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
    
    NSMutableArray *cafeArray = [NSMutableArray new];
    NetworkManager *networkManager = [NetworkManager new];
    [networkManager handleNetworkRequest:@"https://api.yelp.com/v3/businesses/search?term=cafe&latitude=49.281815&longitude=-123.108414" completion:^(NSArray *jsonArray) {
        for (NSDictionary *cafeDict in jsonArray){
            Cafe *cafe = [[Cafe alloc] initWithDictionary:cafeDict];
            [cafeArray addObject:cafe];
        }
    }];
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    NSLog(@"lkasjdf");
    MKCoordinateRegion myRegion;
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
    
    myRegion.span = MKCoordinateSpanMake(0.006, 0.006);
    myRegion.center = center;
    
    [self.mapView setRegion:myRegion animated:true];
    
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations{
    self.location = [locations firstObject];
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways){
        [self.locationManager requestLocation];
    }
}


@end
