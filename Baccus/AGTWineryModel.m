//
//  AGTWineryModel.m
//  Baccus
//
//  Created by Ali Lopez Galaviz on 19/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGTWineryModel.h"

@interface AGTWineryModel ()

@property (strong,nonatomic)NSArray *redWines;
@property (strong,nonatomic)NSArray *whiteWines;
@property (strong,nonatomic)NSArray *otherWines;

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

-(id) init{
    
    if (self = [super init]) {
        
        AGTWineModel *tintorro = [AGTWineModel wineWithName:@"Bembibre"
                                            wineCompanyName:@"Dominio de Tares"
                                                       type:@"tinto"
                                                     origin:@"El Bierzo"
                                                     grapes:@[@"Mencía"]
                                             wineCompanyWeb:[NSURL URLWithString:@"http://www.dominiodetares.com/index.php/es/vinos/baltos/74-bembibrevinos"]
                                                      notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                                     rating:5
                                                      photo:[UIImage imageNamed:@"bembibre.jpg"]];
        
        AGTWineModel *albarinno = [AGTWineModel wineWithName:@"Zárate"
                                             wineCompanyName:@"Zárate"
                                                        type:@"white"
                                                      origin:@"Rias Bajas"
                                                      grapes:@[@"Albariño"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://www.albarino-zarate.com"]
                                                       notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                                      rating:4
                                                       photo:[UIImage imageNamed:@"zarate.gif"]];
        
        AGTWineModel *champagne = [AGTWineModel wineWithName:@"Comtes de Champagne"
                                             wineCompanyName:@"Champagne Taittinger"
                                                        type:@"other"
                                                      origin:@"Champagne"
                                                      grapes:@[@"Chardonnay"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                       notes:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nunc purus. Curabitur eu velit mauris. Curabitur magna nisi, ullamcorper ac bibendum ac, laoreet et justo. Praesent vitae tortor quis diam luctus condimentum. Suspendisse potenti. In magna elit, interdum sit amet facilisis dictum, bibendum nec libero. Maecenas pellentesque posuere vehicula. Vivamus eget nisl urna, quis egestas sem. Vivamus at venenatis quam. Sed eu nulla a orci fringilla pulvinar ut eu diam. Morbi nibh nibh, bibendum at laoreet egestas, scelerisque et nisi. Donec ligula quam, semper nec bibendum in, semper eget dolor. In hac habitasse platea dictumst. Maecenas adipiscing semper rutrum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;"
                                                      rating:5
                                                       photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]];
        
        self.redWines = @[tintorro];
        self.whiteWines = @[albarinno];
        self.otherWines = @[champagne];

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
