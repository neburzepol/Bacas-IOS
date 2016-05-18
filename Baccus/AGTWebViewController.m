//
//  AGTWebViewController.m
//  Baccus
//
//  Created by Ali Lopez Galaviz on 17/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGTWebViewController.h"

@interface AGTWebViewController ()

@end

@implementation AGTWebViewController

-(id)initWithModel:(AGTWineModel*)aModel{
    
    if (self =  [super initWithNibName:nil
                                bundle:nil]) {
        
        _model = aModel;
        
    }
    
    return self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self displayURL: self.model.wineCompanyWeb];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    
}

#pragma mark - Utils
-(void)displayURL:(NSURL *)aUrl{
    
    self.browser.delegate = self;
        
    [self.browser loadRequest:[NSURLRequest requestWithURL:aUrl]];
    
}

@end
