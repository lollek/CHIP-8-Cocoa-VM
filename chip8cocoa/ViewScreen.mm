//
//  ViewScreen.m
//  chip8cocoa
//
//  Created by Olle Kvarnstrom on 09/10/15.
//  Copyright © 2015 Olle Kvarnstrom. All rights reserved.
//

#import "ViewScreen.h"
#import "chip8core/Emulator.h"

@implementation ViewScreen
{
    Emulator emulator;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
