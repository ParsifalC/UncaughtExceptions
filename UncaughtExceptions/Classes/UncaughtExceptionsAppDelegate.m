//
//  UncaughtExceptionsAppDelegate.m
//  UncaughtExceptions
//
//  Created by Matt Gallagher on 2010/05/25.
//  Copyright Matt Gallagher 2010. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "UncaughtExceptionsAppDelegate.h"
#import "RootViewController.h"
#import "UncaughtExceptionHandler.h"

@implementation UncaughtExceptionsAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)installUncaughtExceptionHandler
{
	InstallUncaughtExceptionHandler();
}

- (void)badAccess
{
   void (*nullFunction)() = NULL;
   
   nullFunction();
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch
    window.rootViewController = self.navigationController;
    [window makeKeyAndVisible];
    
    [self performSelector:@selector(installUncaughtExceptionHandler) withObject:nil afterDelay:0];
	[self performSelector:@selector(string) withObject:nil afterDelay:4.0];
//    [self performSelector:@selector(badAccess) withObject:nil afterDelay:10.0];

	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

