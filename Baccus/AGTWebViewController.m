//
//  AGTWebViewController.m
//  Baccus
//
//  Created by Ali Lopez Galaviz on 17/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGTWebViewController.h"
#import "AGTWineryTableViewController.h"

@implementation AGTWebViewController

-(id)initWithModel:(AGTWineModel*)aModel{
    
    if (self =  [super initWithNibName:nil
                                bundle:nil]) {
        
        _model = aModel;
        self.title = @"Web";
        
    }
    
    return self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self displayURL: self.model.wineCompanyWeb];
    
    //Alta en Notificación (Aqui inicia todo el marrano)
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self //Suscriptor (Yo mismo)
               selector:@selector(wineDidChange:)
                   name:NEW_WINE_NOTIFICATION_NAME //Nombre de la notificación
                 object:nil]; //Al que envia la notificacion (nil: Me da igual)
    
}

-(void) wineDidChange: (NSNotification*)aNotification{
    
    NSDictionary *dict = [aNotification userInfo];
    AGTWineModel *newModel = [dict objectForKey:WINE_KEY];
    
    self.model = newModel;
    [self displayURL:self.model.wineCompanyWeb];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    //Baja en la Notificacion
    [[NSNotificationCenter defaultCenter]removeObserver:self];//Nos dabmos de baja de todas las notificaciones
    
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


#pragma mark - Utils
-(void)displayURL:(NSURL *)aUrl{
    
    self.browser.delegate = self;
    
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
        
    [self.browser loadRequest:[NSURLRequest requestWithURL:aUrl]];
    
}

@end
