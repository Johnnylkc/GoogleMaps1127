//
//  HomeCell.m
//  GoogleMaps1127
//
//  Created by 劉坤昶 on 2015/11/27.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 180, 20)];
        self.addressLabel.font = [UIFont systemFontOfSize:10];
        self.addressLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.addressLabel];
        
        
        self.toMapButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 60, 100, 30)];
        [self.toMapButton setTitle:@"看地圖" forState:normal];
        [self.toMapButton setTitleColor:[UIColor blueColor] forState:normal];
        [self.contentView addSubview:self.toMapButton];
        
        
        
    }
    
    
    
    
    return self;
    
    
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
