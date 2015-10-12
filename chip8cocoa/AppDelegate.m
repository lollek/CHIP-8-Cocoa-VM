//
//  AppDelegate.m
//  chip8cocoa
//
//  Created by Olle Kvarnstrom on 08/10/15.
//  Copyright © 2015 Olle Kvarnstrom. All rights reserved.
//

#import "ViewScreen.h"

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property IBOutlet ViewScreen *viewScreen;

@end


@implementation AppDelegate

- (void)openDocument:(id)sender {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    
    // Configure your panel the way you want it
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowsMultipleSelection:NO];
    
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            
            for (NSURL *fileURL in [panel URLs]) {
                [self.viewScreen loadFile:[fileURL path]];
                return;
            }
        }
        
    }];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
