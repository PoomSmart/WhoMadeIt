@protocol CyteTableViewCellDelegate
- (void) drawContentRect:(CGRect)rect;
@end

@interface CyteTableViewCellContentView : UIView {
    id <CyteTableViewCellDelegate> delegate_;
}
- (id)delegate;
- (void)setDelegate:(id <CyteTableViewCellDelegate>)delegate;
@end

@interface CyteTableViewCell : UITableViewCell {
    CyteTableViewCellContentView *content_;
    bool highlighted_;
}
@end

@interface PackageCell : CyteTableViewCell {
	UIImage *icon_;
    NSString *name_;
    NSString *description_;
    bool commercial_;
    NSString *source_;
    UIImage *badge_;
    UIImage *placard_;
    bool summarized_;
}
@end