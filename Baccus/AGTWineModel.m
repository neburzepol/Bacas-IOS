//
//  AGTWineModel.m
//  Baccus
//
//  Created by Ali Lopez Galaviz on 15/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGTWineModel.h"

@implementation AGTWineModel

@synthesize photo = _photo;
#pragma mark - Propiedades
-(UIImage *)photo{
    
    //Esto va a bloquear, y se debe de hacer en segundo plano
    //Sin embargo,aun no debemos hacer eso, asi que por el momentom lo dejamos
    
    //Carga perezosa: solo cargo la imagen si hace falta.
    if (_photo==nil) {
        _photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.photoURL]];
    }
    return _photo;
    
}

#pragma mark - Class method
+(id)wineWithName:(NSString*)aName
  wineCompanyName:(NSString*) aWineCompanyName
             type:(NSString*)aType
           origin:(NSString*)aOrigin
           grapes:(NSArray*)arrayOfGrapes
   wineCompanyWeb:(NSURL*)aURL
            notes:(NSString*)aNotes
           rating:(int)aRating
            photoURL:(NSURL*)aPhotoURL{
    
    return [[self alloc]initWithName:aName
                     wineCompanyName:aWineCompanyName
                                type:aType origin:aOrigin
                              grapes:arrayOfGrapes
                      wineCompanyWeb:aURL notes:aNotes
                              rating:aRating
                               photoURL:aPhotoURL];
    
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

-(id)initWithDictionary:(NSDictionary *)aDict{
    
    return [self initWithName:[aDict objectForKey:@"name"]
              wineCompanyName:[aDict objectForKey:@"wineCompanyName"]
                         type:[aDict objectForKey:@"type"]
                       origin:[aDict objectForKey:@"origin"]
                       grapes:
               wineCompanyWeb:[aDict objectForKey:@"wineCompanyWeb"]
                        notes:[aDict objectForKey:@"notes"]
                       rating:[[aDict objectForKey:@"rating"]intValue]
                     photoURL:[NSURL URLWithString:[aDict objectForKey:@"picture"]]];
    
    
}

-(NSDictionary*)proxyForJSON{
    
    return @{@"name"           : self.name,
             @"wineCompanyName": self.wineCompanyName,
             @"wineCompanyWeb" : self.wineCompanyWeb,
             @"type"           : self.type,
             @"origin"         : self.origin,
             @"grapes"         : self.grapes,
             @"notes"          : self.notes,
             @"rating"         : @(self.rating),
             @"picture"        : [self.photoURL path]
             };
    
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
            photoURL:(NSURL*)aPhotoURL{
    
    if (self = [super init]) {
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = aOrigin;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aURL;
        _notes = aNotes;
        _rating = aRating;
        _photoURL = aPhotoURL;
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
                        photoURL:nil];
    
}

-(NSString*)description{
    
}

#pragma mark - Utils
-(NSArray*)extractGrapesFromJSONArray: (NSArray*)JSONArray{
    
    NSMutableArray *grapes = [NSMutableArray arrayWithCapacity:[JSONArray count]];
    
    for (NSDictionary *dict in JSONArray) {
        [grapes addObject:[dict objectForKey:@"grape"]];
    }
    
    return grapes;
    
}


-(NSArray *)packGrapesIntoJSONArray{
    
    NSMutableArray *jsonArray = [NSMutableArray arrayWithCapacity:[self.grapes count]];
    
    for (NSString *grape in self.grapes) {
        
        [jsonArray addObject:@{@"grape":grape}];
        
    }
    
    return jsonArray;
    
}


@end
