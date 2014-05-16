//
//  Student.h
//  Tutorial - API Usage
//
//  Created by Vishal Deep on 14/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic) int studentId;
@property (strong, nonatomic) NSString *studentName;
@property (nonatomic) int studentAge;
@property (strong, nonatomic) NSString *studentRollNumber;
@property (strong, nonatomic) NSString *studentEmail;
@property (strong, nonatomic) NSString *studentAddress;
@property (strong, nonatomic) NSString *studentContactNumber;

+ (Student*)fromDictionary:(NSDictionary*)dictionary;

@end
