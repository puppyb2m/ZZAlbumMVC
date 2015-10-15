//
//  ViewController.m
//  ZZAlbumMVC
//
//  Created by Chris on 30/04/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    CGRect frame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self allInit];
    
    // 1 set view
    self.view.backgroundColor = [UIColor colorWithRed:0.76f green:0.81f blue:0.87f alpha:1];
    
    // 2 get the album data
    currentAlbumIndex = 0;
    allAlbums = [[LibaryAPI shareInstance] getAlbums];
    
    // 3 set up tableView
    dataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, self.view.bounds.size.width,self.view.bounds.size.height - 120) style:UITableViewStyleGrouped];
    dataTable.delegate = self;
    dataTable.dataSource = self;
    //dataTable.backgroundView = nil;
    [self.view addSubview:dataTable];
    
    // 4 show data
    // 4.1 show song cover
    scroller = [[HorizontalScroller alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    scroller.delegate = self;
    scroller.backgroundColor = [UIColor colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    [self.view addSubview:scroller];
    
    // 4.2 show song detail
    [self showDataForAlbumAtIndex:currentAlbumIndex];
    
//    scroller = [[HorizontalScroller alloc] initWithFrame:CGRectZero];
//    scroller.delegate = self;
    
}

#pragma mark - init
- (void)allInit{

}

#pragma mark - TableView delegate & data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [currentAlbumData[@"titles"] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    // fetch data
    cell.textLabel.text = currentAlbumData[@"titles"][indexPath.row];
    cell.detailTextLabel.text = currentAlbumData[@"values"][indexPath.row];
    
    return cell;
}

#pragma mark - get & show album data
- (void)showDataForAlbumAtIndex:(int)albumIndex{
    // 1 fetch the data
    Album *album = allAlbums[currentAlbumIndex];
    
    // 2 save the data
    currentAlbumData = [album tr_tableRepresentation];
    
    // 3 show the data
    [dataTable reloadData];
}

#pragma mark - reload scroller
- (void)reloadScroller{
    NSLog(@"reload scroller");
    allAlbums = [[LibaryAPI shareInstance] getAlbums];
    if (currentAlbumIndex < 0) {
        currentAlbumIndex = 0;
    } else if (currentAlbumIndex > allAlbums.count){
        currentAlbumIndex = allAlbums.count - 1;
    }
    [scroller reload];
    
    [self showDataForAlbumAtIndex:currentAlbumIndex];
}

#pragma  mark - HorizontalScrollerDelegate
- (void)horizontalScoller:(HorizontalScroller *)scorller clickedAtIndex:(int)atIndex{
    currentAlbumIndex = atIndex;
    [self showDataForAlbumAtIndex:currentAlbumIndex];
}

- (NSInteger)numbersOfViewsForHorizontalScroller:(HorizontalScroller *)scroller{
    //return allAlbums.count;
    
    return 4;
}

- (UIView *)horizontalScoller:(HorizontalScroller *)scorller viewAtIndex:(int)atIndex{
    Album *album = allAlbums[atIndex];
    return [[AlbumView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) albumCover:album.coverURL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
