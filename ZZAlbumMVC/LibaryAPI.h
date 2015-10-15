//
//  LibaryAPI.h
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface LibaryAPI : NSObject

+ (LibaryAPI *)shareInstance;
- (NSArray*)getAlbums;
- (void)addAlbum:(Album*)album atIndex:(int)index;
- (void)deleteAlbumAtIndex:(int)index;
- (void)downloadImage:(NSNotification *)notification;

@end
