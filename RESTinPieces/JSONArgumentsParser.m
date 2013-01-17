//
//  JSONArgumentsParser.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/20/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "JSONArgumentsParser.h"

@implementation JSONArgumentsParser

-(NSData *) parseArguments
{
    if (self.arguments == nil) {
        return nil;
    }

    NSError* parsingError;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:self.arguments options:0 error:&parsingError];
    
    return jsonData;
}

@end
