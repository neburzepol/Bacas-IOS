//
//  AGTWineViewController.m
//  Baccus
//
//  Created by Ali Lopez Galaviz on 15/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGTWineViewController.h"
#import "AGTWebViewController.h"

@implementation AGTWineViewController

-(id)initWithModel:(AGTWineModel*) aModel{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = aModel;
        self.title = aModel.name;
    }
    
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Sincronizamos modelo y vista
- (void)viewWillAppear:(BOOL)animated{//Si la vista va a aparecer mediante una animación
    [super viewWillAppear:animated];
    [self syncModelWithView];
    
    self.edgesForExtendedLayout= UIRectEdgeNone;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                        green:0
                                                                         blue:0.13
                                                                        alpha:1];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
}

#pragma mark - actions
-(IBAction)displayWeb:(id)sender{
    
    //Crear un webVC
    AGTWebViewController *webVC = [[AGTWebViewController alloc]initWithModel:self.model];
    //Hacemos un push
    [self.navigationController pushViewController:webVC animated:YES];
    
    
}

#pragma mark - utils
-(void)syncModelWithView{
    
    self.nameLabel.text = self.model.name;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.notesLabel.text = self.model.notes;
    self.wineryNameLabel.text = self.model.wineCompanyName;
    self.photoView.image = self.model.photo;
    self.grapesLabel.text = [self arraytoString:self.model.grapes];
    
    [self displayRating: self.model.rating];
    
    [self.notesLabel setNumberOfLines:0];
    
}

-(NSString*)arraytoString:(NSArray*) anArray{
    
    NSString *repr = nil;
    
    if (anArray.count == 1) {
        repr = [@"100% " stringByAppendingString:[anArray lastObject]];
    }else{
        repr = [[anArray componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    
    return repr;
    
}

-(void)displayRating:(int)aRating{
    
    [self clearRating];
    
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass"];
    
    for (int x = 0; x < aRating; x++) {
        [[self.ratingViews objectAtIndex:x] setImage:glass];
    }
    
}

-(void)clearRating{
    
    for (UIImageView *imgView in self.ratingViews) {
        imgView.image = nil;
    }
    
}

@end
