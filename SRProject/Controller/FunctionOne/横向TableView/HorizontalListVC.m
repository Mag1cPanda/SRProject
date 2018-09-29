//
//  HorizontalListVC.m
//  SRProject
//
//  Created by longrise on 2018/9/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "HorizontalListVC.h"
#import "MinScrollMenu.h"
#import "MinScrollMenuItem.h"

@interface HorizontalListVC ()
<MinScrollMenuDelegate>
@property (nonatomic, strong) MinScrollMenu *menu;
@end

@implementation HorizontalListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _menu = [[MinScrollMenu alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 100)];
    _menu.delegate = self;
    [self.view addSubview:_menu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - MinScrollMenuDelegate
- (NSInteger)numberOfMenuCount:(MinScrollMenu *)menu {
    return 20;
}

- (MinScrollMenuItem *)scrollMenu:(MinScrollMenu *)menu itemAtIndex:(NSInteger)index {
    static NSString *Id = @"textItem";
    
    MinScrollMenuItem *item = [menu dequeueItemWithIdentifer:Id];
    if (!item) {
        item = [[MinScrollMenuItem alloc] initWithType:TextType reuseIdentifier:Id];
    }
    
    item.backgroundColor = [UIColor redColor];
    item.textLabel.text = [NSString stringWithFormat:@"%zi",index];
    item.textLabel.textAlignment = NSTextAlignmentCenter;
    item.textLabel.backgroundColor = [UIColor blueColor];

    return item;
}

- (CGFloat)scrollMenu:(MinScrollMenu *)menu widthForItemAtIndex:(NSInteger)index {
    return 180;
}

-(void)scrollMenu:(MinScrollMenu *)menu didSelectedItem:(MinScrollMenuItem *)item atIndex:(NSInteger)index
{
    NSLog(@"tap index: %zi",index);
}





@end
