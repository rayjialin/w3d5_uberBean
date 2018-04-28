//
//  NetworkManager.m
//  UberBean
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

-(void)handleNetworkRequest:(NSString *)urlString completion:(void(^)(NSArray *jsonArray))completed{
    
    NSString *urlStr = urlString;
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    [urlRequest addValue:@"Bearer go7iuQW6F3kub5675ECuZhBMueAT8Hoxd29o8TZ57fP9AcdwXUd90txGci4-C2ykHZb2MWFKagINkG2RaQFdt2s79PNY3fXXLNlPVNz2ww_8n7ozBRtTQbHqvY3kWnYx" forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"%@", error);
            });
        }
        
        NSError *jsonError = nil;
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError){
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"%@", jsonError);
            });
        }
        
        if ([json isKindOfClass:[NSDictionary class]]){
            NSDictionary *jsonDict = (NSDictionary *)json;
            dispatch_async(dispatch_get_main_queue(), ^{
                //                [self processResponse:jsonDict];
                NSArray *jsonArray = [NSArray arrayWithArray:jsonDict[@"businesses"]];
                completed(jsonArray);
                
            });
        }
        
    }];
    
    [dataTask resume];
}

-(void)processResponse:(NSDictionary *)responseDict{
    
    
}

-(void)processImageDownload:(NSString *)imageName completion:(void(^)(UIImage *image))completed{
    
    NSURL *url = [NSURL URLWithString:imageName]; // 1
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration]; // 2
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration]; // 3
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) { // 1
            // Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data]; // 2
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // This will run on the main queue
            completed(image);
        }];
        
    }]; // 4
    [downloadTask resume]; // 5
}


@end
