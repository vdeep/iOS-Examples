//
//  StudentModel.m
//  Tutorial - Table View
//
//  Created by Vishal Deep on 12/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

@synthesize sid;
@synthesize firstName;
@synthesize lastName;
@synthesize rollNumber;

- (id)initWithId:(int)_sid firstName:(NSString *)_firstName lastName:(NSString *)_lastName rollNumber:(NSString *)_rollNumber {
    self = [super init];
    
    if (self) {
        sid = _sid;
        firstName = _firstName;
        lastName = _lastName;
        rollNumber = _rollNumber;
    }
    
    return self;
}

@end
