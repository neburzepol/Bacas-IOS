//
//  AGTWineryModel.h
//  Baccus
//
//  Created by Ali Lopez Galaviz on 19/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTWineModel.h"

@interface AGTWineryModel : NSObject

@property (readonly, nonatomic) int redWineCount;
@property (readonly, nonatomic) int whiteWineCount;
@property (readonly, nonatomic) int otherWineCount;

-(AGTWineModel*)redWineAtIndex:(int) index;
-(AGTWineModel*)whiteWineAtIndex:(int) index;
-(AGTWineModel*)otherWineAtIndex:(int) index;

@end
