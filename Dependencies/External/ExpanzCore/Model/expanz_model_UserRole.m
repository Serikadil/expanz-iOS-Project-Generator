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

#import "expanz_model_UserRole.h"

@implementation expanz_model_UserRole

@synthesize roleId = _roleId;
@synthesize roleDescription = _roleDescription;

/* ================================================== Initializers ================================================== */
- (id) initWithRoleId:(NSString*)roleId andDescription:(NSString*)description {
    self = [super init];
    if (self) {
        _roleId = [roleId copy];
        _roleDescription = [description copy];
    }
    return self;
}

/* ================================================== Utility Methods =============================================== */
- (NSString*) description {
    return [NSString stringWithFormat:@"UserRole: roleId=%@, description=%@", _roleId, _roleDescription];
}

@end
