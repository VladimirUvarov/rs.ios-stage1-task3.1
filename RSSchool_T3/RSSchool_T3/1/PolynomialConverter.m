#import "PolynomialConverter.h"

@implementation PolynomialConverter

- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if (numbers == nil || numbers.count == 0) {
        return nil;
    }
    NSString * result = @"";
    int len = (int) (numbers.count);
    for (int i = 0; i < numbers.count; i++) {
        int number = [numbers[i] intValue];
        if (number == 0) {
            continue;
        }
        NSString * sign = (number < 0) ? @" - " : (i == 0 ? @"" : @" + ");
        NSString * member = (abs(number) > 1) ? [@(abs(number)) stringValue] : @"";
        NSString * x = (i < len - 1) ? @"x" : @"";
        NSString * deg = (i < len - 2) ? [NSString stringWithFormat:@"%@%@", @"^", [@((len - i - 1)) stringValue]] : @"";
        result = [NSString stringWithFormat:@"%@%@%@%@%@", result, sign, member, x, deg];
    }
    return result;
}

@end
