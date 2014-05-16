//
//  StudentModel.h
//  Tutorial - Table View
//
//  Created by Vishal Deep on 12/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentModel : NSObject

@property (nonatomic) int sid;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *rollNumber;

- (id)initWithId:(int)_sid firstName:(NSString*)_firstName lastName:(NSString*)_lastName rollNumber:(NSString*)_rollNumber;

@end
