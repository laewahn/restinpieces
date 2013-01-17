//
//  ArgumentsParser.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/20/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "ArgumentsParser.h"

#import "PListParser.h"
#import "JSONArgumentsParser.h"

@implementation ArgumentsParser

-(id)initWithArguments:(NSDictionary *)arguments
{
    self = [self init];
    
    if (self != nil) {
        
        if ([self isMemberOfClass:[ArgumentsParser class]]) {
            [NSException raise:@"Invalid instantiation of abstract class" format:@"Object of class %@ should not be instantiated directly", [self class]];
        }
        
        self.arguments = arguments;
    }
    
    return self;
}

-(NSData *) parseArguments
{
    return nil;
}

+(ArgumentsParser *)parserForFormat:(NSString *)format
{
    if ([format isEqualToString:@"json"]) {
        return [[JSONArgumentsParser alloc] init];
    }
    
    return [[PListParser alloc] init];
}

@end
