//
//  Student.m
//  Tutorial - API Usage
//
//  Created by Vishal Deep on 14/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "Student.h"

@implementation Student

@synthesize studentId;
@synthesize studentName;
@synthesize studentAge;
@synthesize studentRollNumber;
@synthesize studentEmail;
@synthesize studentAddress;
@synthesize studentContactNumber;

+ (Student*)fromDictionary:(NSDictionary*)dictionary {
    Student *student = [[Student alloc] init];
    
    NSDictionary *studentDictionary = (NSDictionary*)[dictionary objectForKey:@"Student"];
    
    student.studentId = [[studentDictionary objectForKey:@"id"] intValue];
    student.studentName = [studentDictionary objectForKey:@"name"];
    student.studentAge = [[studentDictionary objectForKey:@"age"] intValue];
    student.studentRollNumber = [studentDictionary objectForKey:@"roll_number"];
    student.studentEmail = [studentDictionary objectForKey:@"email"];
    student.studentAddress = [studentDictionary objectForKey:@"address"];
    student.studentContactNumber = [studentDictionary objectForKey:@"contact_number"];
    
    return student;
}

@end
