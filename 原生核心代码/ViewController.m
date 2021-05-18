//
//  ViewController.m
//  testfont
//
//  Created by liumiao on 2021/4/27.
//

#import "ViewController.h"
#import <WebKit/WKWebView.h>
#import <WebKit/WKWebViewConfiguration.h>
#import <WebKit/WKPreferences.h>
#import <WebKit/WKScriptMessage.h>
#import <WebKit/WKNavigationDelegate.h>
#import <WebKit/WKUIDelegate.h>
#import <WebKit/WKUserContentController.h>


@interface ViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
{
    WKWebView *wkwebView;
}
@end




@implementation ViewController

+(void)getIos:(NSString *)msg{
    NSLog(@"msg:%@",msg);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /// 创建网页配置对象
    WKUserContentController *_userContentController = [[WKUserContentController alloc] init];
    // 遵守WKScriptMessageHandler协议。注册JS消息，name必须JS发送消息时的名字对应
    [_userContentController addScriptMessageHandler:self name:@"JumpToParentCenter"];


    WKWebViewConfiguration *_configuration = [[WKWebViewConfiguration alloc] init];
    _configuration.userContentController = _userContentController;

    
    wkwebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) configuration:_configuration];
    [self.view addSubview:wkwebView];
    /// Load WebView

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.1.131:7456/"]];
    [wkwebView loadRequest:request];

    
    // UI代理
    wkwebView.UIDelegate = self;
    // 导航代理
    wkwebView.navigationDelegate = self;
    // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
    wkwebView.allowsBackForwardNavigationGestures = YES;
    
   
    
}

#pragma mark - WKScriptMessageHandler
/// 通过接收JS传出消息的name进行捕捉的回调方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
   
    NSLog(@"message.name:%@", message.name);
       NSLog(@"message.body:%@", message.body);
    ///阿拉拉拉 解析
    //调用js
    
    [wkwebView evaluateJavaScript:@"revMsg('bbbb')" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
           NSLog(@"error %@", error);
       }];

}




@end
