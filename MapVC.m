//
//  MapVC.m
//  GoogleMaps1127
//
//  Created by 劉坤昶 on 2015/11/27.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "MapVC.h"

@import GoogleMaps;


@interface MapVC ()
{
    
    GMSMapView *mapView_;
    
    double lastLatitude ;
    double lastLongitude ;
}

@end

@implementation MapVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
//    lastLatitude = [self.myLatitude doubleValue];
//    lastLongitude = [self.myLongitude doubleValue];
    
    lastLongitude = 120.302869308;
    lastLatitude = 22.6391832615;
  
    
    [self showMap];

}



-(void)showMap
{

GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:lastLatitude
                                                        longitude:lastLongitude
                                                             zoom:15];
mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
mapView_.myLocationEnabled = YES;
self.view = mapView_;

// Creates a marker in the center of the map.
GMSMarker *marker = [[GMSMarker alloc] init];
marker.position = CLLocationCoordinate2DMake(lastLatitude , lastLongitude);
marker.title = @"高雄";
marker.snippet = @"這是高雄";
marker.map = mapView_;

}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
