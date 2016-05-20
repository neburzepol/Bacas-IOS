//
//  AGTWineryTableViewController.h
//  Baccus
//
//  Created by Ali Lopez Galaviz on 19/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineryModel.h"

#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2

@interface AGTWineryTableViewController : UITableViewController

@property (strong, nonatomic) AGTWineryModel *model;

-(id)initWithModel:(AGTWineryModel*)aModel
             style:(UITableViewStyle) aStyle;

@end
