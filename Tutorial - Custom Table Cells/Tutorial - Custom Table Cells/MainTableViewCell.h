//
//  MainTableViewCell.h
//  Tutorial - Custom Table Cells
//
//  Created by Vishal Deep on 21/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageView_pic;
@property (strong, nonatomic) IBOutlet UILabel *label_Title;
@property (strong, nonatomic) IBOutlet UILabel *label_description;

@end
