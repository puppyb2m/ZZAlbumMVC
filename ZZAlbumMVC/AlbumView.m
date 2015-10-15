
//
//  AlbumView.m
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "AlbumView.h"

@implementation AlbumView{

    UIImageView *coverImageV;
    UIActivityIndicatorView *indicator;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame albumCover:(NSString *)albumCover{
    self = [super initWithFrame:frame];
    
    if (self) {
        //cover init
        self.backgroundColor = [UIColor blackColor];
        coverImageV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, frame.size.width - 10, frame.size.height - 10)];
        [self addSubview:coverImageV];
        
        //indicator init
        indicator = [[UIActivityIndicatorView alloc] init];
        indicator.center = self.center;
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [indicator startAnimating];
        [self addSubview:indicator];
        [coverImageV addObserver:self forKeyPath:@"image" options:0 context:nil];
        
        // !!!!!!!!!!!!!!!!!!!&&&&&&&&&&&&&&&&&&&&&&&&&&&&
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DownloadImageNotification" object:self userInfo:@{@"imageView":coverImageV, @"coverURL":albumCover}];

        
    }
    
    return self;
}


#pragma mark - observe to stop indicator
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"image"]) {
        [indicator stopAnimating];
    }
    
}

@end
