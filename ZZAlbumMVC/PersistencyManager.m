//
//  PersistencyManager.m
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "PersistencyManager.h"

@implementation PersistencyManager{
    NSMutableArray *albums;
}

#pragma mark - init
- (id)init
{
    self = [super init];
    if (self) {
        // a dummy list of albums
        albums = [NSMutableArray arrayWithArray:
                  @[[[Album alloc] initWithTitle:@"Best of Bowie" artist:@"David Bowie" coverURL:@"http://www.coversproject.com/static/thumbs/album/album_david%20bowie_best%20of%20bowie.png" year:@"1992"],
                    [[Album alloc] initWithTitle:@"It's My Life" artist:@"No Doubt" coverURL:@"http://www.coversproject.com/static/thumbs/album/album_no%20doubt_its%20my%20life%20%20bathwater.png" year:@"2003"],
                    [[Album alloc] initWithTitle:@"Nothing Like The Sun" artist:@"Sting" coverURL:@"http://www.coversproject.com/static/thumbs/album/album_sting_nothing%20like%20the%20sun.png" year:@"1999"],
                    [[Album alloc] initWithTitle:@"Staring at the Sun" artist:@"U2" coverURL:@"http://www.coversproject.com/static/thumbs/album/album_u2_staring%20at%20the%20sun.png" year:@"2000"],
                    [[Album alloc] initWithTitle:@"American Pie" artist:@"Madonna" coverURL:@"http://www.coversproject.com/static/thumbs/album/album_madonna_american%20pie.png" year:@"2000"]]];
    }
    return self;
}


#pragma mark - modify album
- (NSArray *)getAlbum{
    return albums;
}
- (void)addAlbum:(Album *)album atIndex:(int)index{
    if (albums.count >= index) {
        [albums insertObject:album atIndex:index];
    } else {
        [albums addObject:album];
    }
}
- (void)deletAlbumatIndex:(int)index{
    [albums removeObjectAtIndex:index];
}

#pragma mark - save & get image to/from file
- (void)saveImage:(UIImage *)iamge fileName:(NSString *)fileName{
    fileName = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", fileName];
    NSLog(@"%@", iamge);
    NSData *coverImageData = UIImagePNGRepresentation(iamge);
    //[coverImageData writeToFile:fileName atomically:YES];
    if ([coverImageData writeToFile:fileName atomically:YES]) {
        NSLog(@"persi mgr ok");
    }else{
        NSLog(@"persi mgr fail");
    }
}
- (UIImage *)getImageFromLocal:(NSString *)fileName{
    fileName = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", fileName];
    NSData *coverImageData = [NSData dataWithContentsOfFile:fileName];
    //NSLog(@"save :%@", fileName);
    return [UIImage imageWithData:coverImageData];
}
@end
