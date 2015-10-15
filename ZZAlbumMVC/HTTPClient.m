//
//  HTTPClient.m
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

- (UIImage *)downloadImage:(NSString *)coverURL{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:coverURL]];
    UIImage *image = [UIImage imageWithData:imageData];
    
    return image;
}

@end