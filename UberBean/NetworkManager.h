//
//  NetworkManager.h
//  UberBean
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface NetworkManager : NSObject
-(void)handleNetworkRequest:(NSString *)urlString completion:(void(^)(NSArray *jsonArray))completed;
-(void)processImageDownload:(NSString *)imageName completion:(void(^)(UIImage *image))completed;
@end
