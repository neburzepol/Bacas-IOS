//
//  AGTWineryTableViewController.m
//  Baccus
//
//  Created by Ali Lopez Galaviz on 19/05/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGTWineryTableViewController.h"
#import "AGTWineViewController.h"
#import "AGTWineModel.h"

@interface AGTWineryTableViewController ()

@end

@implementation AGTWineryTableViewController

-(id)initWithModel:(AGTWineryModel *)aModel style:(UITableViewStyle)aStyle{
    
    if (self = [super initWithStyle:aStyle]) {
        _model = aModel;
        self.title = @"Baccus";
    }
    
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.edgesForExtendedLayout= UIRectEdgeNone;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                           green:0
                                                                            blue:0.13
                                                                           alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == RED_WINE_SECTION) {
        return @"Red Wines";
    }else if(section == WHITE_WINE_SECTION){
        return @"White Wines";
    }else{
        return @"Other Wines";
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {

    if (section == RED_WINE_SECTION) {
        return self.model.redWineCount;
    }else if (section ==WHITE_WINE_SECTION){
        return self.model.whiteWineCount;
    }else{
        return self.model.otherWineCount;
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    if (cell == nil) {
        //tenemos que crearla a mano
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:CellIndentifier];
    }
    
    //Averiguar de que modelo de vino nos estan hablando
    AGTWineModel *wine = nil;
    if (indexPath.section == RED_WINE_SECTION) {//Con el Path podemos determinar la seccion al igual que la fila :)
        wine = [self.model redWineAtIndex:indexPath.row];
    }else if (indexPath.section == WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }else{
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    
    //Sincronizar celda(Vista) y modelo (vino)
    cell.imageView.image = wine.photo;
    cell.textLabel.text =  wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    return cell;
}

#pragma mark: Table View delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Supongamos que estamos en un NavigationController (Aqui es donde ocurre la magia)
    
    //Averiguamos de que vino se trata
    AGTWineModel *wine = nil;
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    }else if (indexPath.section ==WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }else{
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    [self.delegate wineryTableViewController:self didSelecteWine:wine];
    
    //Notificación
    
    NSNotification *n = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME object:self userInfo:@{WINE_KEY:wine}];
    
    [[NSNotificationCenter defaultCenter] postNotification:n];
    
    //Guardar el ultimo vino seleccionado
    [self saveLastSelectedWineAtSection:indexPath.section
                                    row:indexPath.row];
    
}
#pragma mark -  Utils

- (AGTWineModel *)wineForIndexPath:(NSIndexPath *)indexPath
{
    // Averiguamos de qué vino se trata
    AGTWineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    }
    else if (indexPath.section == WHITE_WINE_SECTION) {
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }
    else {
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    return wine;
}

#pragma mark: NSUserDefaults
-(NSDictionary *)setDefaults{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //Por defecto mostramos el primero de los vinos
    NSDictionary *defaultWineCoords = @{SECTION_KEY:@(RED_WINE_SECTION), ROW_KEY:@0};
    
    //Lo asignamos
    [defaults setObject:defaultWineCoords
                 forKey:LAST_WINE_KEY];
    
    //Guardamos por si las moscas
    [defaults synchronize];
    
    return defaultWineCoords;

}

-(void)saveLastSelectedWineAtSection:(NSUInteger)section row:(NSUInteger)row{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{SECTION_KEY:@(section),
        ROW_KEY:@(row)}
                 forKey:LAST_WINE_KEY];
    
    [defaults synchronize]; //Por si acaso, que Murphy acecha.
    
}

-(AGTWineModel*)lastSelectedWine{
    
    NSIndexPath *indexPath = nil;
    NSDictionary *coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_WINE_KEY];
    
    if (coords == nil) {
        //No hay nada bajo la clave LAST_WINE_KEY
        //Esto quiere decir que es la primera vez que se llama a la app
        //Ponemos un valor por defecto: EL primero de los vinos
        coords = [self setDefaults];
        
    }else{
        //Ya hay algo, es decir, en algun momento se guardo.
        //No hay nada en especial que hacer
    }
    //Transformamos estas coordenadas en un indexpath
    indexPath =[NSIndexPath indexPathForRow:[[coords objectForKey:ROW_KEY]integerValue]
                                  inSection:[[coords objectForKey:SECTION_KEY]integerValue]];
    
    //Devolvemos el vino en cuestion
    return [self wineForIndexPath:indexPath];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
