//
//  AGTWineryModel.m
//  Baccus
//
//  Created by Ali Lopez Galaviz on 19/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGTWineryModel.h"

@interface AGTWineryModel ()

@property (strong,nonatomic)NSMutableArray *redWines;
@property (strong,nonatomic)NSMutableArray *whiteWines;
@property (strong,nonatomic)NSMutableArray *otherWines;

@end

@implementation AGTWineryModel

#pragma mark - Properties

-(int) redWineCount{
    
    return [self.redWines count];
    
}

-(int) whiteWineCount{
    
    return [self.whiteWines count];

}

-(int)otherWineCount{

    return [self.otherWines count];

}

#pragma mark - Init
-(id)init{
    
    if (self = [super init]) {
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://static.keepcoding.io/baccus/wines.json"]];
        NSURLResponse *response = [[NSURLResponse alloc] init];
        NSError *error;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        if (data != nil) {
            // No ha habido error
            NSArray * JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:kNilOptions
                                                                      error:&error];
            
            if (JSONObjects != nil) {
                // No ha habido error
                for(NSDictionary *dict in JSONObjects){
                    AGTWineModel *wine = [[AGTWineModel alloc] initWithDictionary:dict];
                    
                    // Añadimos al tipo adecuado
                    if ([wine.type isEqualToString:RED_WINE_KEY]) {
                        if (!self.redWines) {
                            self.redWines = [NSMutableArray arrayWithObject:wine];
                        }
                        else {
                            [self.redWines addObject:wine];
                        }
                    }
                    else if ([wine.type isEqualToString:WHITE_WINE_KEY]) {
                        if (!self.whiteWines) {
                            self.whiteWines = [NSMutableArray arrayWithObject:wine];
                        }
                        else {
                            [self.whiteWines addObject:wine];
                        }                    }
                    else {
                        if (!self.otherWines) {
                            self.otherWines = [NSMutableArray arrayWithObject:wine]; //fix/11a
                        }
                        else {
                            [self.otherWines addObject:wine]; //fix/11a
                        }
                    }
                }
            }else{
                // Se ha producido un error al parsear el JSON
                NSLog(@"Error al parsear JSON: %@", error.localizedDescription);
            }
        }else{
            // Error al descargar los datos del servidor
            NSLog(@"Error al descargar datos del servidor: %@", error.localizedDescription);
        }
    }
    return self;
}

-(AGTWineModel*)redWineAtIndex:(int) index{
    
    return [self.redWines objectAtIndex:index];
    
}

-(AGTWineModel*)whiteWineAtIndex:(int) index{
    
    return [self.whiteWines objectAtIndex:index];
    
}

-(AGTWineModel*)otherWineAtIndex:(int) index{
    
    return [self.otherWines objectAtIndex:index];
    
}

@end
