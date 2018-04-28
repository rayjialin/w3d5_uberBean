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
#import "CafeDetailViewController.h"

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

            NSString *rating = [NSString new];
            NSInteger ratingNumber = 0;
            NSLog(@"%@", cafeDict[@"rating"]);
            ratingNumber = [cafeDict[@"rating"] integerValue];
            for (int i = 0; i < ratingNumber; i++){
                rating = [rating stringByAppendingString:@"⭐"];
            }
            
            Cafe *cafe = [[Cafe alloc] initWithCoordinate:CLLocationCoordinate2DMake([cafeDict[@"coordinates"][@"latitude"] doubleValue], [cafeDict[@"coordinates"][@"longitude"] doubleValue])
                                                 andTitle:cafeDict[@"name"]
                                                andRating:rating];
            cafe.cafeImageName = cafeDict[@"image_url"];
            [cafeArray addObject:cafe];
        }
        
        // add annotations
        [self.mapView addAnnotations:cafeArray];
        [self.mapView showAnnotations:cafeArray animated:TRUE];
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

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    MKMarkerAnnotationView *markerView = (MKMarkerAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"myId"];
    if (!markerView)
    {
        UIView *detailView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        markerView.detailCalloutAccessoryView = detailView;
        
        // If an existing pin view was not available, create one.
        markerView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myId"];
        markerView.canShowCallout = YES;
//        markerView.image = [UIImage imageNamed:@"foodPin.png"];

        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        markerView.rightCalloutAccessoryView = rightButton;

        // Add an image to the left callout.
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"staff"]];
        markerView.leftCalloutAccessoryView = iconView;

    }
    return markerView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{

    Cafe *cafeAnnotation = (Cafe *)view.annotation;
    [self performSegueWithIdentifier:@"detailCafe" sender:cafeAnnotation];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(Cafe *)cafeAnnotation{
    if ([[segue identifier] isEqualToString:@"detailCafe"])
    {
        // Get reference to the destination view controller
        CafeDetailViewController *detailVC = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        detailVC.cafeAnnotation = cafeAnnotation;
    }}

@end
