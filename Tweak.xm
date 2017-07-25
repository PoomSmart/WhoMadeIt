#import <UIKit/UIKit.h>
#import "Package.h"
#import "PackageCell.h"
#import "Source.h"

@interface Source (Addition)
@property(retain, nonatomic) NSString *author;
@end

char authorKey;
BOOL override = NO;

%hook NSBundle

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)table {
	return %orig(override && [key isEqualToString:@"FROM"] ? @"BY" : key, value, table);
}

%end

%hook Source

%new
- (void)setAuthor:(NSString *)author {
    objc_setAssociatedObject(self, &authorKey, author, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

%new
- (NSString *)author {
    return objc_getAssociatedObject(self, &authorKey);
}

//%property(retain, nonatomic) NSString *author;

- (NSString *)label {
	return self.author ? self.author : %orig;
}

%end

%hook PackageCell

- (void)setPackage:(Package *)package asSummary:(bool)summary {
	[package parse];
	Source *source = [package source];
	source.author = [[package author] name];
	HBLogDebug(@"%@ made by %@", package, source.author);
	override = YES;
	%orig(package, summary);
	override = NO;
	source.author = nil;
}

%end