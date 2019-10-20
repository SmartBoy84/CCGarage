#import "garage.h"
#import "spawn.h"

@implementation garage

//Return the icon of your module here
- (UIImage *)iconGlyph
{
    return [UIImage imageNamed:@"AppIcon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

//Return the color selection color of your module here
- (UIColor *)selectedColor
{
    return [UIColor colorWithRed:(168.0/255.0) green:(180.0/255.0) blue:(75.0/255.0) alpha:1.0];
}


- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    [self garage];
  [super refreshState];
}

- (void)garage{
    pid_t pid;
    int status;
    const char* args[] = {"curl", "http://gabba.ga/open", NULL};
    posix_spawn(&pid, "/usr/bin/curl", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}
@end
