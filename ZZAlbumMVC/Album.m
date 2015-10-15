//
//  Album.m
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "Album.h"

@implementation Album

- (id)initWithTitle:(NSString *)nTitle artist:(NSString *)nArtist coverURL:(NSString *)nCoverURL year:(NSString*)nYear{
    self = [super init];
    
    if (self) {
        _title = nTitle;
        _artist = nArtist;
        _coverURL = nCoverURL;
        _year = nYear;
    }
    
    return  self;
}

@end
