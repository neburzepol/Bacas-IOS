//
//  AGTWineryTableViewController.h
//  Baccus
//
//  Created by Ali Lopez Galaviz on 19/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//
//  *Nota: Una practica muy buena es no importar en el .h, si no usar el @class e importar en el .m
#import <UIKit/UIKit.h>
#import "AGTWineryModel.h"

#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2

//Declaracion adelantada (Adelantamos diciendole que es una clase, para contrastar el problema en el protocolo)
@class AGTWineryTableViewController;

@protocol WineryTableViewControllerDelegate <NSObject>

-(void)wineryTableViewController:(AGTWineryTableViewController *)wineryVC didSelecteWine:(AGTWineModel*) aWine;

@end

@interface AGTWineryTableViewController : UITableViewController

@property (strong, nonatomic) AGTWineryModel *model;
@property (weak, nonatomic)id<WineryTableViewControllerDelegate> delegate;

-(id)initWithModel:(AGTWineryModel*)aModel
             style:(UITableViewStyle) aStyle;

@end
