//
//  HorizontalScroller.h
//  ZZAlbumMVC
//
//  Created by Chris on 2/05/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HorizontalScrollerDelegate;

@interface HorizontalScroller : UIView

@property (weak) id<HorizontalScrollerDelegate> delegate;

- (void)reload;
- (void)scrollerTapped:(UITapGestureRecognizer *)recognizer;
- (void)centerCurrentView;
- (void)test;

@end

@protocol HorizontalScrollerDelegate <NSObject>
// methods declaration goes in here

@required
// how many album do you have
- (NSInteger)numbersOfViewsForHorizontalScroller:(HorizontalScroller *)scroller;

// return the view at (index)
- (UIView *)horizontalScoller:(HorizontalScroller *)scorller viewAtIndex:(int)atIndex;

// the view is selected
- (void)horizontalScoller:(HorizontalScroller *)scorller clickedAtIndex:(int)atIndex;

@optional
// initialize
- (NSInteger)initializeIndexForHorizontalScroller:(HorizontalScroller *)scoller;

@end

