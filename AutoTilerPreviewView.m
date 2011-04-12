//
//  AutoTilerPreviewView.m
//  AutoTiler
//
//  Created by Joshua Garnham on 16/03/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AutoTilerPreviewView.h"


@implementation AutoTilerPreviewView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
	if (imageToTile != nil) {
		CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
		
		CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)[imageToTile TIFFRepresentation], NULL);
		CGImageRef tilingImage = CGImageSourceCreateImageAtIndex(source, 0, NULL);
		
		CGRect imageSize = CGRectMake(0, 0, imageToTile.size.width, imageToTile.size.height);
		
		CGContextDrawTiledImage(context, imageSize, tilingImage);
	}
}

- (void)tileImage:(NSImage *)image {
	imageToTile = [image retain];
	[self setNeedsDisplay:YES];
}

- (void)cancelTiling {
	[imageToTile release];
	imageToTile = nil;
	[self setNeedsDisplay:YES];
}


@end
