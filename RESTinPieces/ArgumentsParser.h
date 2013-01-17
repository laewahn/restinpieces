//
//  ArgumentsParser.h
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/20/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import <Foundation/Foundation.h>

/// An ArgumentsParser is used to parse the arguments for a NSURLRequest into the specific format.
/**
 
 ArgumentsParser is the abstract basic that serves for the implemtation of other parsers. Parsers are used to parse the arguments for a request into a format that is used by the server.
 
 The ArgumentsParser base class also provides a class method to get the parser for a given format.
 
 */
@interface ArgumentsParser : NSObject

// Factory method to receive a parser for the given format.
+(ArgumentsParser *)parserForFormat:(NSString *)format;

// Initialize new parser with the given arguments.
-(id)initWithArguments:(NSDictionary *)arguments;

// Parse the arguments.
-(NSData *) parseArguments;

// The parsers arguments.
@property NSDictionary* arguments;


@end
