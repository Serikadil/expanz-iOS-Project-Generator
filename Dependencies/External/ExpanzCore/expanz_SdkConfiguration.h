////////////////////////////////////////////////////////////////////////////////
//
//  EXPANZ
//  Copyright 2008-2011 EXPANZ
//  All Rights Reserved.
//
//  NOTICE: Expanz permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////


#import <Foundation/Foundation.h>


@interface expanz_SdkConfiguration : NSObject {

    NSString* _blobCacheUrl;
}

@property(nonatomic, strong, readonly) NSString* baseUrl;
@property(nonatomic, strong, readonly) NSString* preferredSite;
@property(nonatomic, strong, readonly) NSString* userType;
@property(nonatomic, strong) NSString* blobCacheUrl;


+ (expanz_SdkConfiguration*) globalConfiguration;

+ (void) setGlobalConfiguration:(expanz_SdkConfiguration*)configuration;

+ (void) clearGlobalConfiguration;

+ (void) setConfigurationFile:(NSString*)fileName;

- (id) initWithBaseUrl:(NSString*)url preferredSite:(NSString*)site userType:(NSString*)userType;

- (id) initWithXmlString:(NSString*)configXml;

- (NSString*) createSessionServiceUrl;

- (NSString*) execXServiceUrl;

- (NSString*) getBlobServiceUrl;

- (NSString*) listAvailableSitesUrl;

- (NSString*) listActivitiesForSiteUrl;

- (NSString*) schemaForActivityUrl;

- (void) setConfigurationFile:(NSString*)fileName;

@end
/* ================================================================================================================== */
@compatibility_alias SdkConfiguration expanz_SdkConfiguration;