//
//  AutoTilerPreviewView.h
//  AutoTiler
//
//  Created by Joshua Garnham on 16/03/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AutoTilerPreviewView : NSView {
	NSImage *imageToTile;
}

- (void)tileImage:(NSImage *)image;
- (void)cancelTiling;

@end
