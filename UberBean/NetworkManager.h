//
//  NetworkManager.h
//  UberBean
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject
-(void)handleNetworkRequest:(NSString *)urlString completion:(void(^)(NSArray *jsonArray))completed;
@end
