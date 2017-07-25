#import "MIMEAddress.h"
#import "Source.h"

@interface Package : NSObject 
- (MIMEAddress *)author;
- (Source *)source;
- (void)parse;
@end