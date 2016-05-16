//
//  AGTWineModel.h
//  Baccus
//
//  Created by Ali Lopez Galaviz on 15/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

#define NO_RATING -1

@interface AGTWineModel : NSObject

@property (strong,nonatomic) NSString *type;
@property (strong,nonatomic) UIImage *photo;
@property (strong,nonatomic) NSURL *wineCompanyWeb;
@property (strong,nonatomic) NSString *notes;
@property (strong,nonatomic) NSString *origin;
@property (nonatomic) int rating; //0 - 5
@property (strong,nonatomic) NSArray *grapes;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *wineCompanyName;

//Metodos de clase
+(id)wineWithName:(NSString*)aName
  wineCompanyName:(NSString*) aWineCompanyName
             type:(NSString*)aType
           origin:(NSString*)aOrigin
           grapes:(NSArray*)arrayOfGrapes
   wineCompanyWeb:(NSURL*)aURL
            notes:(NSString*)aNotes
           rating:(int)aRating
            photo:(UIImage*)aPhoto;

+(id)wineWithName:(NSString*)aName
  wineCompanyName:(NSString*)aWineCompanyName
             type:(NSString*)aType
           origin:(NSString*)anOrigin;

//Designado
-(id)initWithName:(NSString*)aName
  wineCompanyName:(NSString*) aWineCompanyName
             type:(NSString*)aType
           origin:(NSString*)aOrigin
           grapes:(NSArray*)arrayOfGrapes
   wineCompanyWeb:(NSURL*)aURL
            notes:(NSString*)aNotes
           rating:(int)aRating
            photo:(UIImage*)aPhoto;

-(id)initWithName:(NSString*)aName
  wineCompanyName:(NSString*)aWineCompanyName
             type:(NSString*)aType
           origin:(NSString*)anOrigin;




@end
