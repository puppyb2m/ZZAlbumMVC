//
//  LibaryAPI.m
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "LibaryAPI.h"
#import "HTTPClient.h"
#import "PersistencyManager.h"

@implementation LibaryAPI{
    PersistencyManager *persistencyManager;
    HTTPClient *httpClient;
}

+ (LibaryAPI *)shareInstance{
    // 1
    static LibaryAPI *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibaryAPI alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init{
    self = [super init];
    
    if (self) {
        persistencyManager = [[PersistencyManager alloc] init];
        httpClient = [[HTTPClient alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downloadImage:) name:@"DownloadImageNotification" object:nil];
    }
    
    return  self;
}

- (NSArray*)getAlbums{

    return [persistencyManager getAlbum];
}

- (void)addAlbum:(Album*)album atIndex:(int)index{
    [persistencyManager addAlbum:album atIndex:index];
}
- (void)deleteAlbumAtIndex:(int)index{
    [persistencyManager deletAlbumatIndex:index];
}

- (void)downloadImage:(NSNotification *)notification{
    NSLog(@"");
    // 1
    UIImageView *coverImageView = notification.userInfo[@"imageView"];
    NSString *coverURL = notification.userInfo[@"coverURL"];
    //UIImage *image;
    
    // 2
    coverImageView.image = [persistencyManager getImageFromLocal:[coverURL lastPathComponent]];
    if (coverImageView.image == nil) {
        NSLog(@"hell there");
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [httpClient downloadImage:coverURL];
            
            // 4
            dispatch_sync(dispatch_get_main_queue(), ^{
                coverImageView.image = image;
                [persistencyManager saveImage:image fileName:[coverURL lastPathComponent]];
            });
        });

    }
}

@end
