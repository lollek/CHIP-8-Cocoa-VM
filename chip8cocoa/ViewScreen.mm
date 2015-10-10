//
//  ViewScreen.m
//  chip8cocoa
//
//  Created by Olle Kvarnstrom on 09/10/15.
//  Copyright © 2015 Olle Kvarnstrom. All rights reserved.
//

#import "OpenGL/gl.h"

#import "chip8core/Emulator.h"

#import "ViewScreen.h"

@implementation ViewScreen {
    Emulator emulator;
}

- (void)prepareOpenGL {
    [super prepareOpenGL];
    [NSTimer scheduledTimerWithTimeInterval:0.016
                                     target:self
                                   selector:@selector(drawGraphicsEvent)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)drawGraphicsEvent {
    uint8_t const* pixels = emulator.getGraphicsData();
    uint8_t pixelsAsBytes[64 * 32];
    for (unsigned i = 0; i < 64 * 32 / 8; ++i) {
        pixelsAsBytes[i*8 + 0] = pixels[i] & 0x80 ? 0xFF : 0x00;
        pixelsAsBytes[i*8 + 1] = pixels[i] & 0x40 ? 0xFF : 0x00;
        pixelsAsBytes[i*8 + 2] = pixels[i] & 0x20 ? 0xFF : 0x00;
        pixelsAsBytes[i*8 + 3] = pixels[i] & 0x10 ? 0xFF : 0x00;
        pixelsAsBytes[i*8 + 4] = pixels[i] & 0x08 ? 0xFF : 0x00;
        pixelsAsBytes[i*8 + 5] = pixels[i] & 0x04 ? 0xFF : 0x00;
        pixelsAsBytes[i*8 + 6] = pixels[i] & 0x02 ? 0xFF : 0x00;
        pixelsAsBytes[i*8 + 7] = pixels[i] & 0x01 ? 0xFF : 0x00;
    }
    
    glTexImage2D(GL_TEXTURE_2D, 0, GL_LUMINANCE, 64,32, 0, GL_LUMINANCE, GL_UNSIGNED_BYTE, pixelsAsBytes);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    
    
    glClearColor(0, 0.2, 0.5, 0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glEnable(GL_TEXTURE_2D);
    glBegin(GL_QUADS);
    {
        glTexCoord2f(0.0, 1.0);
        glVertex2f(-1.0, -1.0);
        glTexCoord2f(1.0, 1.0);
        glVertex2f(1.0, -1.0);
        glTexCoord2f(1.0, 0.0);
        glVertex2f(1.0, 1.0);
        glTexCoord2f(0.0, 0.0);
        glVertex2f(-1.0, 1.0);
    }
    glEnd();
    
    glFlush();
    
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self drawGraphicsEvent];
}

@end
