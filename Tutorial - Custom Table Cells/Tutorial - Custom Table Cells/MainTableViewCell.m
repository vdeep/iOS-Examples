//
//  MainTableViewCell.m
//  Tutorial - Custom Table Cells
//
//  Created by Vishal Deep on 21/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

@synthesize imageView_pic;
@synthesize label_Title;
@synthesize label_description;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    self.imageView_pic.layer.cornerRadius = self.imageView_pic.frame.size.height / 2;
}

@end
