//
//  UIImage+Helpers.h
//  Tutorial - Custom Table Cells
//
//  Created by Vishal Deep on 21/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helpers)

+ (void) loadFromURL: (NSURL*) url callback:(void (^)(UIImage *image))callback;

@end
