//
//  RESTResourceSpecifier.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "RESTResourceSpecifier.h"

@implementation RESTResourceSpecifier

-(id)initWithController:(NSString *)aController method:(NSString *)aMethod identifier:(NSString *)identifier format:(NSString *)format;
{
    self = [super init];
    
    if (self != nil) {
        self.controller = aController;
        self.method = aMethod;
        self.identifier = identifier;
        self.format = format;
    }
    
    return self;
}

-(NSString *)generatePath
{
    
    NSMutableString* pathString = [[NSMutableString alloc] initWithString:self.controller];
    
    if (self.method && !([self.method isEqualToString:@"index"] || [self.method isEqualToString:@""])) {
        [pathString appendFormat:@"/%@", self.method];
    }
    
    if (self.identifier || [self.identifier isEqualToString:@""]) {
        [pathString appendFormat:@"/%@", self.identifier];
    }
    
    if (self.format) {
        [pathString appendFormat:@".%@", self.format];
    }
    
    return pathString;

}

@end
