//
//  Album+TableRepresentation.h
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "Album.h"

@interface Album (TableRepresentation)

- (NSDictionary *)tr_tableRepresentation;

@end
