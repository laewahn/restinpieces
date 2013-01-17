//
//  RESTResourceSpecifierTests.h
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class RESTResourceSpecifier;

@interface RESTResourceSpecifierTests : SenTestCase {
    RESTResourceSpecifier *testGenerator;
    NSString* expectedPath;
    NSString* generatedPath;
}

@end
