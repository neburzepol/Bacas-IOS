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

#define DID_SELECTED_WINE_NOTIFICATION_NAME @"newWineSelected"
#define WINE_KEY @"wine"

#define SECTION_KEY @"section"
#define ROW_KEY @"row"
#define LAST_WINE_KEY @"lastWine"

#define NEW_WINE_NOTIFICATION_NAME @"newWine"

//Declaracion adelantada (Adelantamos diciendole que es una clase, para contrastar el problema en el protocolo)
@class AGTWineryTableViewController;

@protocol WineryTableViewControllerDelegate <NSObject>

-(void)wineryTableViewController:(AGTWineryTableViewController *)wineryVC
                  didSelecteWine:(AGTWineModel*) aWine;

@end

@interface AGTWineryTableViewController : UITableViewController <WineryTableViewControllerDelegate>

@property (strong, nonatomic) AGTWineryModel *model;
@property (weak, nonatomic)id<WineryTableViewControllerDelegate> delegate;

//Designado
-(id)initWithModel:(AGTWineryModel*)aModel
             style:(UITableViewStyle) aStyle;

- (AGTWineModel *)lastSelectedWine;

@end
