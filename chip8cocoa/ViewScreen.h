//
//  ViewScreen.h
//  chip8cocoa
//
//  Created by Olle Kvarnstrom on 09/10/15.
//  Copyright © 2015 Olle Kvarnstrom. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewScreen : NSOpenGLView

- (void)keyUp:(NSEvent*)theEvent;
- (void)keyDown:(NSEvent *)theEvent;

- (void)loadFile:(NSString*)path;

@end
