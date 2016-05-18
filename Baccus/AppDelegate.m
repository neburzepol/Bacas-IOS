//
//  AppDelegate.m
//  Baccus
//
//  Created by Ali Lopez Galaviz on 15/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTWineModel.h"
#import "AGTWineViewController.h"
#import "AGTWebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];//acopla la pantalla
    
    // Creamos un modelo
    AGTWineModel *tintorro = [AGTWineModel wineWithName:@"Bembibre"
                                        wineCompanyName:@"Dominio de Tares"
                                                   type:@"tinto"
                                                 origin:@"El Bierzo"
                                                 grapes:@[@"Mencía"]
                                         wineCompanyWeb:[NSURL URLWithString:@"http://www.dominiodetares.com/index.php/es/vinos/baltos/74-bembibrevinos"]
                                                  notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                                 rating:3
                                                  photo:[UIImage imageNamed:@"bembibre.jpg"]];
    
    // Creamos los controlador
    AGTWineViewController *wineVC = [[AGTWineViewController alloc]initWithModel:tintorro];
    //AGTWebViewController *webVC = [[AGTWebViewController alloc]initWithModel:tintorro];
    
    // Creamos el combinador
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:wineVC];
    
    
    //Lo asignamos como controlador raiz
    self.window.rootViewController = navVC;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor orangeColor];//Asigna color a la pantallar
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    //La aplicacion dejara de ser la activa (Algun tipo de interrupcion como llamada telefonica
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //Cuando una aplicacion pasa a backgroud, tienes 5 segundos para hacer algo, guardar datos, cerrar conexiones de redes, parar sonidos, pausar juegos etc.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    //Volver a primer plano
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    //Ya esta en primer plano
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
