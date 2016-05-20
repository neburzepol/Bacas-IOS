//
//  AGTWineryTableViewController.h
//  Baccus
//
//  Created by Ali Lopez Galaviz on 19/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineryModel.h"
@interface AGTWineryTableViewController : UITableViewController

@property (strong, nonatomic) AGTWineryModel *model;

-(id)initWithModel:(AGTWineryModel*)aModel
             style:(UITableViewStyle) aStyle;

@end
