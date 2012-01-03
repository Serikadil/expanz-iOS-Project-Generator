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

#import "SpecHelper.h"
#import "xcode_Group.h"
#import "xcode_Project.h"
#import "xcode_ClassDefinition.h"

SPEC_BEGIN(GroupSpec)

    __block Project* project;
    __block Group* group;

    beforeEach(^{
        project =
            [[Project alloc] initWithFilePath:@"/Users/jblues/ExpanzProjects/expanz-iOS-SDK/expanz-iOS-SDK.xcodeproj"];
        group = [project groupWithName:@"Main"];
    });


    describe(@"Source files.", ^{

        it(@"should allow adding a source file.", ^{

            ClassDefinition* classDefinition = [[ClassDefinition alloc] initWithName:@"ESA_Foobar_ViewController"];
            [classDefinition setHeader:@"@interface ESA_Foobar_ViewController @end"];
            [classDefinition setSource:@"@implementation ESA_Foobar_ViewController @end"];


            assertThat(group, notNilValue());
            [group addClass:classDefinition];
            [project save];

            LogDebug(@"Done");

        });


    });


    SPEC_END