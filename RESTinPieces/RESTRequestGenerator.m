//
//  RESTRequestGenerator.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "RESTRequestGenerator.h"
#import "RESTResourceSpecifier.h"
#import "ArgumentsParser.h"

@interface RESTRequestGenerator() {
    NSMutableURLRequest* request;
    NSString* generatedResourcePath;
    NSURL* generatedResourceURL;
    NSData* parsedArguments;
    NSString* getArguments;

}
@end

@implementation RESTRequestGenerator

-(id)initWithResource:(RESTResourceSpecifier *)resource serverURL:(NSURL *)serverURL httpMethod:(NSString *)httpMethod arguments:(NSDictionary *)arguments timeout:(NSInteger) timeout
{
    self = [super init];
    
    if (self) {
        self.resource = resource;
        self.serverURL = serverURL;
        self.httpMethod = httpMethod;
        self.arguments = arguments;
        self.timeout = timeout;
    }
    
    return self;
}

-(NSURLRequest *)generateRequest
{
    [self generateURL];
    [self parseArguments];
    [self buildRequest];
    
    return request;
}


# pragma mark -
# pragma mark Private methods

-(void)generateURL
{
    generatedResourcePath = [self.resource generatePath];
    
    if ([self.httpMethod isEqualToString:@"GET"]) {
        [self addArgumentsToResourcePath];
    }
    
    generatedResourceURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", self.serverURL, generatedResourcePath]];    
}

-(void)addArgumentsToResourcePath
{
    if (self.arguments != nil) {
        
        [self parseGETArguments];
        generatedResourcePath = [generatedResourcePath stringByAppendingFormat:@"?%@", getArguments];
    }
}

-(void)parseGETArguments
{
    NSMutableString* builtString = [NSMutableString string];
    
    for (NSString* argument in [self.arguments allKeys]) {
        NSString* argumentString = [NSString stringWithFormat:@"%@=%@&", argument, [self.arguments objectForKey:argument]];
        [builtString appendString:argumentString];
    }
    
    // remove last & (in a dirty way)
    NSInteger stringLenght = [builtString length] -1;
    getArguments = [builtString substringWithRange:NSMakeRange(0, stringLenght)];
}

-(void)parseArguments
{
    ArgumentsParser* parser = [ArgumentsParser parserForFormat:self.resource.format];
    [parser setArguments:self.arguments];
    
    parsedArguments = [parser parseArguments];
}

-(void)buildRequest
{
    request = [[NSMutableURLRequest alloc] init];
    request.URL = generatedResourceURL;
    request.HTTPMethod = self.httpMethod;
    request.HTTPBody = parsedArguments;
    request.timeoutInterval = self.timeout;
}


@end
