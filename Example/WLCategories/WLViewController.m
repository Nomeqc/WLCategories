//
//  WLViewController.m
//  WLCategories
//
//  Created by nomeqc@gmail.com on 07/05/2018.
//  Copyright (c) 2018 nomeqc@gmail.com. All rights reserved.
//

#import "WLViewController.h"
#import "WLCategories.h"


@import WebKit;
#import "NSObject+WLNotificationObserve.h"
#import "WLSecondViewController.h"

@interface WLViewController ()

@property (nonatomic) WKWebView *webView;

@end

@implementation WLViewController

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (IBAction)didTapBarButton:(id)sender {
    [self.view endEditing:YES];
    WLSecondViewController *secondVC = [[WLSecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
    
//    WKWebsiteDataStore *dateStore = [WKWebsiteDataStore defaultDataStore];
//    NSSet *types = [NSSet setWithArray:@[WKWebsiteDataTypeDiskCache,
//                                         WKWebsiteDataTypeOfflineWebApplicationCache,
//                                         WKWebsiteDataTypeMemoryCache,
//                                         WKWebsiteDataTypeLocalStorage]];
//    [dateStore fetchDataRecordsOfTypes:types
//                     completionHandler:^(NSArray<WKWebsiteDataRecord *> * __nonnull records) {
//                         for (WKWebsiteDataRecord *record  in records)
//                         {
//                             //                             if ( [record.displayName containsString:@"baidu"]) //取消备注，可以针对某域名清除，否则是全清
//                             //                             {
//
//                             //                             }
//                             NSLog(@"record displayName:%@",record.displayName);
//
////                             if ([record.displayName containsString:XDBH5URL(@"").host]) {
////                                 [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:record.dataTypes
////                                                                           forDataRecords:@[record]
////                                                                        completionHandler:^{
////                                                                            NSLog(@"Cookies for %@ deleted successfully",record.displayName);
////                                                                            BLOCK_EXEC(completion);
////                                                                        }];
////                             }
//                         }
//                     }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self wl_observeNotificationWithName:UIKeyboardWillShowNotification object:nil handler:^(NSNotification *notification) {
//        NSLog(@"keyboard will show");
//    }];
//    [self wl_observeNotificationWithName:UIKeyboardWillShowNotification object:nil handler:^(NSNotification *notification) {
//        NSLog(@"keyboard will show");
//    }];
//    [self wl_observeNotificationWithName:UIKeyboardWillShowNotification object:nil handler:^(NSNotification *notification) {
//        NSLog(@"keyboard will show");
//    }];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 100, 300, 150)];
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
    _webView = webView;
    
//    NSArray *titles = @[@"0",
//                        @"1",
//                        @"2",
//                        @"3",
//                        @"4",
//                        @"5",
//                        @"6",
//                        @"7",
//                        @"8",
//                        @"9",
//                        @"0",
//                        @"-"];
//    NSArray *groupArray = [titles wl_groupArrayWithSize:11];
    
    NSURL *URL = [NSURL URLWithString:@"https://www.baidu.com/"];
//    URL = [NSURL URLWithString:@"git@github.com:Nomeqc/WLAutoScrollingView.git"];
    NSLog(@"scheme:%@",URL.scheme);
    NSLog(@"resourceSpecifier:%@",URL.resourceSpecifier);
    NSLog(@"host:%@",URL.host);
    NSLog(@"port:%@",URL.port);
    NSLog(@"user:%@",URL.user);
    NSLog(@"password:%@",URL.password);
    NSLog(@"path:%@",URL.path);
    NSLog(@"fragment:%@",URL.fragment);
    NSLog(@"parameterString:%@",URL.parameterString);
    NSLog(@"query:%@",URL.query);
    NSLog(@"relativePath:%@",URL.relativePath);
    
//    @property (nullable, readonly, copy) NSString *scheme;
//    @property (nullable, readonly, copy) NSString *resourceSpecifier;
    
    /* If the URL conforms to rfc 1808 (the most common form of URL), the following accessors will return the various components; otherwise they return nil.  The litmus test for conformance is as recommended in RFC 1808 - whether the first two characters of resourceSpecifier is @"//".  In all cases, they return the component's value after resolving the receiver against its base URL.
     */
//    @property (nullable, readonly, copy) NSString *host;
//    @property (nullable, readonly, copy) NSNumber *port;
//    @property (nullable, readonly, copy) NSString *user;
//    @property (nullable, readonly, copy) NSString *password;
//    @property (nullable, readonly, copy) NSString *path;
//    @property (nullable, readonly, copy) NSString *fragment;
//    @property (nullable, readonly, copy) NSString *parameterString;
//    @property (nullable, readonly, copy) NSString *query;
//    @property (nullable, readonly, copy) NSString *relativePath;
//    [Test test];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
