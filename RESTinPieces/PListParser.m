//
//  DefaultParser.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/20/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "PListParser.h"

@implementation PListParser

-(NSData *) parseArguments
{
    NSString* errorString;
    NSData* plistData = [NSPropertyListSerialization dataFromPropertyList:self.arguments format:NSPropertyListXMLFormat_v1_0 errorDescription:&errorString];
    return plistData;
}

@end
