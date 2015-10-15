//
//  PersistencyManager.h
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"
#import <UIKit/UIKit.h>

@interface PersistencyManager : NSObject

- (NSArray *)getAlbum;
- (void)addAlbum:(Album *)album atIndex:(int)index;
- (void)deletAlbumatIndex:(int)index;

- (void)saveImage:(UIImage *)iamge fileName:(NSString *)fileName;
- (UIImage *)getImageFromLocal:(NSString *)fileName;

@end
