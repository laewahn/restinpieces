//
//  RESTResourceSpecifier.h
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import <Foundation/Foundation.h>

/// The RESTResourceSpecifier is used to create the path for a RESTful resource.
/**
    
 With the RESTResourceSpecifier, a you can get the path for a RESTful resource by providing the controller name and optionally a method, identifier and a format.
 
 As example, a resource behind controller named MyController with the id 1 and the format .json will produce the path MyController/1.json
 
*/
@interface RESTResourceSpecifier : NSObject

// Initialize a new RESTResourceSpecifier for a given controller and optionally a method, an id and a format
-(id)initWithController:(NSString *)aController method:(NSString *)aMethod identifier:(NSString *)identifier format:(NSString *)format;

// Generate the path for the resource
-(NSString *)generatePath;

// The controller for the resource
@property NSString* controller;

// Optional: The method called on the controller
@property NSString* method;

// Optional: The id of the resource
@property NSString* identifier;

// Optional: The format used for the resource
@property NSString* format;


@end
