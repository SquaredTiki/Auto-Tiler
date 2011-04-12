//
//  AutoTilerAppDelegate.m
//  AutoTiler
//
//  Created by Joshua Garnham on 16/03/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AutoTilerAppDelegate.h"

@implementation AutoTilerAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (void)cancel:(id)sender {
	[sender setTitle:@"Tile Image"];
	[sender setAction:@selector(previewImage:)];
	[saveImageButton setEnabled:NO];

	[previewView cancelTiling];
}

- (IBAction)previewImage:(id)sender {
	if (![imageLocation.stringValue isEqualToString:@""]) {		
		CGRect previewViewRect = CGRectMake(0, 0, [widthField.stringValue floatValue], [heightField.stringValue floatValue]);
		[previewView setFrame:previewViewRect];
				
		NSImage *imageToTile = [[NSImage alloc] initWithContentsOfFile:imageLocation.stringValue];
		[previewView tileImage:imageToTile];
		
		[sender setTitle:@"Cancel"];
		[sender setAction:@selector(cancel:)];
		[saveImageButton setEnabled:YES];
	}
}

- (IBAction)saveImage:(id)sender {	
/*	NSOpenPanel *openPanel = [NSOpenPanel openPanel];
	[openPanel setTitle:@"Save Tiled Image"];
	[openPanel setPrompt:@"Save"];
	[openPanel setCanChooseFiles:NO];
	[openPanel setCanChooseDirectories:YES];
	[openPanel beginSheetForDirectory:NSHomeDirectory()
                              file:nil
					modalForWindow:window
					 modalDelegate:self
					didEndSelector:@selector(didEndOpenSheet:returnCode:contextInfo:)
					   contextInfo:NULL];	*/
	
	// Creating a representation of the image within the bounds of the pyramid
	NSBitmapImageRep *rep = [previewView bitmapImageRepForCachingDisplayInRect:[previewView frame]];
	[previewView cacheDisplayInRect:[previewView bounds] toBitmapImageRep:rep];
	
	// Converting the representation to PNG and sending it to the pasteboard (with type indicated)
	NSData *imageData = [rep representationUsingType:NSPNGFileType properties:nil];
	
	int runResult;
	NSSavePanel *savePanel = [NSSavePanel savePanel];
	[savePanel setCanSelectHiddenExtension:YES];
	[savePanel setRequiredFileType:@"png"];
	runResult = [savePanel runModalForDirectory:nil file:nil];
	if (runResult == NSOKButton) {
		if (![imageData writeToFile:[[savePanel URL] path] atomically:YES])
			NSLog(@"didn't work!");
	}
}

-(void)didEndOpenSheet:(NSSavePanel *)openPanel
			returnCode:(int)returnCode contextInfo:(void *)contextInfo {
	if (returnCode != NSOKButton)
		return;
	

	NSLog(@"URL %@", [openPanel directoryURL]);
	
	//[imageData writeToURL:[openPanel directoryURL] atomically:NO];
}

@end
