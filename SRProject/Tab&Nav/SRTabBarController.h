//
//  SRTabBarController.h
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (Configuration)

-(void)setupWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

@end

@interface SRTabBarController : UITabBarController

@end
