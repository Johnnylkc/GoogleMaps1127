//
//  HomeTVC.m
//  GoogleMaps1127
//
//  Created by 劉坤昶 on 2015/11/27.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "HomeTVC.h"
#import "HomeCell.h"
#import "MapVC.h"

#import "AFNetworking.h"

@interface HomeTVC ()
{
    
    NSMutableArray *locoDataArray;
    
    
}

@end

@implementation HomeTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[HomeCell class] forCellReuseIdentifier:@"HomeCell"];
    
    self.tableView.rowHeight = 120;
    
    [self AFNetworking];
    
    
    
}



-(void)AFNetworking
{
    
    NSURL *url = [NSURL URLWithString:@"http://data.kaohsiung.gov.tw/Opendata/DownLoad.aspx?Type=2&CaseNo1=AV&CaseNo2=1&FileType=1&Lang=C&FolderType=O"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];

    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    serializer.removesKeysWithNullValues = YES;
    operation.responseSerializer = serializer;
    
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        locoDataArray = [[NSMutableArray alloc] init];
        locoDataArray = (NSMutableArray*)responseObject;
        
        
        
        
        //NSLog(@"%@" , locoDataArray);
        
        [self.tableView reloadData];
        
        NSLog(@"johnny");
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"shit");
        
        
    }];
    
    [operation start];
    
}






















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return locoDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    
    NSDictionary *dicForCell = locoDataArray[indexPath.row];
    
    cell.addressLabel.text = dicForCell[@"Add"];
    
    
    [cell.toMapButton addTarget:self action:@selector(showMap:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


-(void)showMap:(UIButton*)button
{
    MapVC *controller = [[MapVC alloc] init];
    
    [self presentViewController:controller animated:YES completion:nil];
    
    
//    controller.myLatitude = oldDic[@"aa"];
//    controller.myLongitude = oldDic[@"bb"];
//    NSLog(@"%@ " , controller.myLatitude );
//    NSLog(@"%@" , controller.myLongitude);
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
