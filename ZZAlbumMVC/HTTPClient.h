//
//  HTTPClient.h
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HTTPClient : NSObject

- (UIImage *)downloadImage:(NSString *)coverURL;

@end
