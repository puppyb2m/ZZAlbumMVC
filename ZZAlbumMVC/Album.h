//
//  Album.h
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic, copy, readonly) NSString *title, *artist, *genre, *coverURL, *year;

- (id)initWithTitle:(NSString *)nTitle artist:(NSString *)nArtist coverURL:(NSString *)nCoverURL year:(NSString*)nYear;

@end
