//
//  Album+TableRepresentation.m
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "Album+TableRepresentation.h"

@implementation Album (TableRepresentation)

- (NSDictionary *)tr_tableRepresentation{

    return @{@"titles":@[@"Artist", @"Album", @"Year"],
             @"values":@[self.artist, self.title, self.year]};
}

@end
