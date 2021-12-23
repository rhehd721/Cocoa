//
//  Person.m
//  KVO_KVC_Test
//
//  Created by bhPark on 2021/12/23.
//

#import "Person.h"

@implementation Person

-(id)init{

    self = [super init];
    if(self){
        self.name = @"hello";
        self.age = 0;
    }
    
    return self;
}

@end
