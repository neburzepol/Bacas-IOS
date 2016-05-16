//
//  AGTWineModel.m
//  Baccus
//
//  Created by Ali Lopez Galaviz on 15/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGTWineModel.h"

@implementation AGTWineModel
#pragma mark - Class method
+(id)wineWithName:(NSString*)aName
  wineCompanyName:(NSString*) aWineCompanyName
             type:(NSString*)aType
           origin:(NSString*)aOrigin
           grapes:(NSArray*)arrayOfGrapes
   wineCompanyWeb:(NSURL*)aURL
            notes:(NSString*)aNotes
           rating:(int)aRating
            photo:(UIImage*)aPhoto{
    
    return [[self alloc]initWithName:aName
                     wineCompanyName:aWineCompanyName
                                type:aType origin:aOrigin
                              grapes:arrayOfGrapes
                      wineCompanyWeb:aURL notes:aNotes
                              rating:aRating
                               photo:aPhoto];
    
}

+(id)wineWithName:(NSString*)aName
  wineCompanyName:(NSString*)aWineCompanyName
             type:(NSString*)aType
           origin:(NSString*)anOrigin{
    
    return [[self alloc]initWithName:aName
                     wineCompanyName:aWineCompanyName
                                type:aType
                              origin:anOrigin];
}

#pragma mark - init
-(id)initWithName:(NSString*)aName
  wineCompanyName:(NSString*)aWineCompanyName
             type:(NSString*)aType
           origin:(NSString*)aOrigin
           grapes:(NSArray*)arrayOfGrapes
   wineCompanyWeb:(NSURL*)aURL
            notes:(NSString*)aNotes
           rating:(int)aRating
            photo:(UIImage*)aPhoto{
    
    if (self = [super init]) {
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = aOrigin;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aURL;
        _notes = aNotes;
        _rating = aRating;
        _photo = aPhoto;
    }
    
    return self;
}

-(id)initWithName:(NSString*)aName
  wineCompanyName:(NSString*)aWineCompanyName
             type:(NSString*)aType
           origin:(NSString*)anOrigin{
    
    return [self initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType
                       origin:anOrigin
                       grapes:nil
               wineCompanyWeb:nil
                        notes:nil
                       rating:NO_RATING
                        photo:nil];
    
}


@end
