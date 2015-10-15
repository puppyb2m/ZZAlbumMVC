//
//  HorizontalScroller.m
//  ZZAlbumMVC
//
//  Created by Chris on 2/05/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "HorizontalScroller.h"

// 1
#define VIEW_PADDING 10
#define VIEW_DIMENSIONS 100
#define VIEWS_OFFSET 100

@interface HorizontalScroller ()<UIScrollViewDelegate>

@end


@implementation HorizontalScroller{
    UIScrollView *scroller;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// init
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        // init scrollview
        scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        // add to main view
        scroller.delegate = self;
        [self addSubview:scroller];
        
        // add tap gesture
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollerTapped:)];
        [scroller addGestureRecognizer:tapGesture];
        }
    
    return self;
}

- (void)test{
    NSLog(@"3%ld", (long)[self.delegate numbersOfViewsForHorizontalScroller:self]);
}

- (void)scrollerTapped:(UITapGestureRecognizer *)recognizer{
    // search which one is tapped & move to center
    
    CGPoint location = [recognizer locationInView:recognizer.view];
    
    for (int index = 0; index < [self.delegate numbersOfViewsForHorizontalScroller:self]; index ++) {
        UIView *view = 	scroller.subviews[index];
        if (CGRectContainsPoint(view.frame, location)) {
            // move to center
            [self.delegate horizontalScoller:self clickedAtIndex:index];
            [scroller setContentOffset:CGPointMake(view.frame.origin.x - self.frame.size.width/2 + view.frame.size.width/2, 0) animated:YES];
            break;
        }
    }
}

- (void)reload{
    NSLog(@"reload");
    // 1 - nothing to load if there's no delegate
    if (self.delegate == nil) return;
    
    // 2 - remove all subviews
    [scroller.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    
    // 3 - arrange the sub view
    CGFloat xValue = VIEWS_OFFSET;
    for (int i = 0; i < [self.delegate numbersOfViewsForHorizontalScroller:self]; i ++) {
        // add view to scroller
        xValue += VIEW_PADDING;
        
        UIView *view = [self.delegate horizontalScoller:self viewAtIndex:i];
        view.frame = CGRectMake(xValue, VIEW_PADDING, VIEW_DIMENSIONS, VIEW_DIMENSIONS);
        [scroller addSubview:view];
        
        xValue += VIEW_DIMENSIONS + VIEW_PADDING;
    }
    //    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    //    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURL *url = [NSURL URLWithString:@"http://www.coversproject.com/static/thumbs/album/album_david%20bowie_best%20of%20bowie.png"];
    //
    //    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    //        UIImage *iamge = [UIImage imageWithData:data];
    //
    //
    //        [scroller addSubview:imageView];
    //    }];
    //    [task resume];
    
    
    //NSData *data = [NSData dataWithContentsOfURL:url];

    
    
    

    
    
    
    //[self addSubview:scroller];
    
    // 4 - size of scroller
    [scroller setContentSize:CGSizeMake(xValue+VIEWS_OFFSET, self.frame.size.height)];
}

- (void)centerCurrentView{
    NSLog(@"centerCurrentView");
    int xFinal = scroller.contentOffset.x + (VIEWS_OFFSET/2) + VIEW_PADDING;
    NSLog(@"%.f", scroller.contentOffset.x);
    int viewIndex = xFinal / (VIEW_DIMENSIONS+(2*VIEW_PADDING));
    xFinal = viewIndex * (VIEW_DIMENSIONS+(2*VIEW_PADDING));
    [scroller setContentOffset:CGPointMake(xFinal,0) animated:YES];
    [self.delegate horizontalScoller:self clickedAtIndex:viewIndex];
}

- (void)didMoveToSuperview{
    [self reload];
}

#pragma mark - drag scroll view
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        [self centerCurrentView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self centerCurrentView];
}


@end
