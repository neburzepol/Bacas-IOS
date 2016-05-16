//
//  AGTWineViewController.h
//  Baccus
//
//  Created by Ali Lopez Galaviz on 15/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineModel.h"

@interface AGTWineViewController : UIViewController

@property (strong, nonatomic) AGTWineModel *model;

-(id)initWithModel:(AGTWineModel*) aModel;

@end
