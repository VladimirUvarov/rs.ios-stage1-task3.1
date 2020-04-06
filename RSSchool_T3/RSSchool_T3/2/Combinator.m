#import "Combinator.h"

@implementation Combinator

long f(int v) {
    if (v < 2) {
        return 1;
    } else {
        return v * f(v - 1);
    }
}

- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    if (array == nil || array.count < 2) {
        return nil;
    }
    int c = [array[0] intValue];
    int n = [array[1] intValue];
    int k = 1;
    long res = 0;
    do {
        if (k > n) {
            return nil;
        }
        res = f(n) / (f(k) * f(n - k));
        k++;
    }
    while (res < c);
    return [[NSNumber alloc] initWithInteger: (k - 1)];
}

@end
