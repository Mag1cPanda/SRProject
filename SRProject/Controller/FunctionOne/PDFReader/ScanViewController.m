//
//  ScanViewController.m
//  PDFViewAndDownload
//
//  Created by Dustin on 17/4/6.
//  Copyright © 2017年 PicVision. All rights reserved.
//

#import "ScanViewController.h"
#import "PDFWebViewViewController.h"
#import "CGContextDrawPDFListViewController.h"
#import <QuickLook/QuickLook.h>
#import "Masonry.h"
#define PDF_URL @"https://www.tutorialspoint.com/ios/ios_tutorial.pdf"
#define PDF_FILE_PATH [[NSBundle mainBundle] pathForResource:@"git-cheatsheet" ofType:@"pdf"]
#define PDF_FILE_PATH1 [[NSBundle mainBundle] pathForResource:@"003" ofType:@"pdf"]
#import "ReaderViewController.h"
#import "MCDownloader.h"
#import "NSString+URL.h"

@interface ScanViewController ()<UITableViewDataSource,UITableViewDelegate,QLPreviewControllerDelegate,QLPreviewControllerDataSource,ReaderViewControllerDelegate>

@end

@implementation ScanViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建UITableview列表
    UITableView *myTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 60) style:UITableViewStylePlain];
    //去除列表下面的多余的分割线
    myTV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    myTV.delegate = self;
    myTV.dataSource = self;
    [self.view addSubview:myTV];
}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scanCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"scanCell"];
    }
    
    cell.textLabel.textColor = [UIColor colorWithRed:64/255.0 green:136.0/255.0 blue:164/255.0 alpha:1.0];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"UIWebView本地浏览";
            break;
        case 1:
            cell.textLabel.text = @"UIWebView在线浏览";
            break;
        case 2:
            cell.textLabel.text = @"QLPreviewController浏览";
            break;
        case 3:
            cell.textLabel.text = @"PDF Reader";
            break;
        case 4:
            cell.textLabel.text = @"CGContext DrawPDFPage";
            break;
            
        default:
            break;
    }
    
    
    
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            //UIWebView加载本地pdf文件
            PDFWebViewViewController *webViewVC = [[PDFWebViewViewController alloc] init];
            webViewVC.urlStr = [[NSBundle mainBundle] pathForResource:@"bbwAPP" ofType:@"pdf"];
            [self.navigationController pushViewController:webViewVC animated:YES];
            
//            NSString *str = @"http://zhimei.hntv.tv/bbvideo/2018/10/12/2.1jsjzdsyzfdbsfs.pdf";
            //            NSString *tmpStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//            NSURL *URL = [NSURL URLWithString:str];
//            [[MCDownloader sharedDownloader] downloadDataWithURL:URL progress:^(NSInteger receivedSize, NSInteger expectedSize, NSInteger speed, NSURL * _Nullable targetURL) {
//
//            } completed:^(MCDownloadReceipt * _Nullable receipt, NSError * _Nullable error, BOOL finished) {
//
//                PDFWebViewViewController *webViewVC = [[PDFWebViewViewController alloc] init];
//                webViewVC.urlStr = receipt.filePath;
//                [self.navigationController pushViewController:webViewVC animated:YES];
//
//            }];
            
            
            break;
        }
        case 1:{
            //UIWebView加载网络pdf文件
            PDFWebViewViewController *webViewVC = [[PDFWebViewViewController alloc] init];
            NSString *str = @"http://zhimei.hntv.tv/bbvideo/2018/10/12/2.1jsjzdsyzfdbsfs.pdf";
            NSString *urlStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSLog(@"%@",urlStr);
            webViewVC.urlStr = urlStr;
            [self.navigationController pushViewController:webViewVC animated:YES];
            break;
        }
        case 2:{
            //QLPreviewController初始化,需要导入QuickLook.framework
            QLPreviewController *QLPVC = [[QLPreviewController alloc] init];
            QLPVC.delegate = self;
            QLPVC.dataSource = self;
            [self.navigationController pushViewController:QLPVC animated:YES];
            
            break;
        }
        case 3:{
            //Reader初始化 加载本地pdf文件
//            ReaderDocument *doc = [[ReaderDocument alloc] initWithFilePath:PDF_FILE_PATH1 password:nil];
//            ReaderViewController *rederVC = [[ReaderViewController alloc] initWithReaderDocument:doc];
//            rederVC.delegate = self;
//            rederVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//            rederVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
//            [self.navigationController pushViewController:rederVC animated:YES];
            
            //网络文件
//            NSURL *URL = [NSURL URLWithString:PDF_URL];
            NSString *str = @"http://zhimei.hntv.tv/bbvideo/2018/10/12/2.1jsjzdsyzfdbsfs.pdf";
//            NSString *tmpStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSURL *URL = [NSURL URLWithString:str];
            [[MCDownloader sharedDownloader] downloadDataWithURL:URL progress:^(NSInteger receivedSize, NSInteger expectedSize, NSInteger speed, NSURL * _Nullable targetURL) {

            } completed:^(MCDownloadReceipt * _Nullable receipt, NSError * _Nullable error, BOOL finished) {
                ReaderDocument *doc = [[ReaderDocument alloc] initWithFilePath:receipt.filePath password:nil];
                ReaderViewController *rederVC = [[ReaderViewController alloc] initWithReaderDocument:doc];
                rederVC.delegate = self;
                rederVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                rederVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
                NSArray *tmpArr = [receipt.truename componentsSeparatedByString:@"."];
                NSString *title = tmpArr[0];
                rederVC.titleStr = title;
                [self.navigationController pushViewController:rederVC animated:YES];
            }];
            
            break;
        }
        case 4:{
            //跳到CGContextDraw控制器，利用CGContext 画pdf
            CGContextDrawPDFListViewController *vc = [CGContextDrawPDFListViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        }

        default:
            break;
    }
   
}


#pragma mark QLPreviewControllerDataSource
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return 2;
}
- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    NSArray *arr = @[PDF_FILE_PATH,PDF_FILE_PATH1];
    return [NSURL fileURLWithPath:arr[index]];
}


#pragma mark ReaderViewControllerDelegate因为PDF阅读器可能是push出来的，也可能是present出来的，为了更好的效果，这个代理方法可以实现很好的退出
- (void)dismissReaderViewController:(ReaderViewController *)viewController{
    
//    if (self.presentingViewController) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    } else {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
    [self.navigationController popViewControllerAnimated:YES];
    
//    if (self.navigationController.topViewController == self) {
//        [self.navigationController popViewControllerAnimated:YES];
//    } else {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
}



@end
