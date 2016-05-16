//
//  AGTWineViewController.m
//  Baccus
//
//  Created by Ali Lopez Galaviz on 15/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGTWineViewController.h"

@implementation AGTWineViewController

-(id)initWithModel:(AGTWineModel*) aModel{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = aModel;
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
}

-(void)viewWillDisappear:(BOOL)animated{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
