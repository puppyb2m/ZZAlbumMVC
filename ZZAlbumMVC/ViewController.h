//
//  ViewController.h
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibaryAPI.h"
#import "Album+TableRepresentation.h"
#import "AlbumView.h"
#import "HorizontalScroller.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, HorizontalScrollerDelegate>{
    UITableView *dataTable;
    NSArray *allAlbums;
    NSDictionary *currentAlbumData;
    int currentAlbumIndex;
    HorizontalScroller *scroller;
}

- (void)allInit;
- (void)showDataForAlbumAtIndex:(int)albumIndex;
- (void)reloadScroller;

@end

