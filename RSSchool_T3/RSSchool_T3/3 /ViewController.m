#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UILabel *labelRed;
@property(nonatomic, strong) UILabel *labelBlue;
@property(nonatomic, strong) UILabel *labelGreen;
@property(nonatomic, strong) UIButton *buttonProcess;
@property(nonatomic, strong) UITextField *textFieldRed;
@property(nonatomic, strong) UITextField *textFieldGreen;
@property(nonatomic, strong) UITextField *textFieldBlue;
@property(nonatomic, strong) UILabel *labelResultColor;
@property(nonatomic, strong) UIView *viewResultColor;

@end

@implementation ViewController

#pragma mark -

int const TOP_PADDING = 130;
int const BETWEEN_PADDING = 30;
int const LEFT_PADDING = 30;
int const RIGHT_PADDING = 40;
int const BUTTON_WIDTH = 100;
int const COLTROL_HEIGHT = 30;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.accessibilityIdentifier = @"mainView";

    int width = UIScreen.mainScreen.bounds.size.width;
    int y = TOP_PADDING;
    int textViewWidth = width - LEFT_PADDING - RIGHT_PADDING - BUTTON_WIDTH;
    
    self.labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_PADDING, y, BUTTON_WIDTH, COLTROL_HEIGHT)];
    [self.labelResultColor setText:@"Color"];
    [self.labelResultColor setTextColor:UIColor.blackColor];
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    [self.view addSubview: self.labelResultColor];
    
    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectMake(LEFT_PADDING + BUTTON_WIDTH + 20, y, textViewWidth-20, COLTROL_HEIGHT)];
    [[self.viewResultColor layer] setBorderWidth:1];
    [self.viewResultColor setBackgroundColor:UIColor.grayColor];
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    [self.view addSubview: self.viewResultColor];
    
    y = y + COLTROL_HEIGHT + BETWEEN_PADDING;
    
    self.labelRed = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_PADDING, y, BUTTON_WIDTH, COLTROL_HEIGHT)];
    [self.labelRed setText:@"RED"];
    [self.labelRed setTextColor:UIColor.redColor];
    self.labelRed.accessibilityIdentifier = @"labelRed";
    [self.view addSubview: self.labelRed];
    
    self.textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(LEFT_PADDING + BUTTON_WIDTH, y, textViewWidth, COLTROL_HEIGHT)];
    [self.textFieldRed setPlaceholder:@"0..255"];
    self.textFieldRed.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, COLTROL_HEIGHT)];
    self.textFieldRed.leftViewMode = UITextFieldViewModeAlways;
    [self.textFieldRed setKeyboardType:UIKeyboardTypeNumberPad];
    [[self.textFieldRed layer] setBorderWidth:1];
    [self.textFieldRed setTextColor:UIColor.redColor];
    [self.textFieldRed setDelegate:self];
    self.textFieldRed.returnKeyType = UIReturnKeyDone;
    self.textFieldRed.font = [UIFont systemFontOfSize:14.0f];
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    [self.view addSubview: self.textFieldRed];
    
    y = y + COLTROL_HEIGHT + BETWEEN_PADDING;
    
    self.labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_PADDING, y, BUTTON_WIDTH, COLTROL_HEIGHT)];
    [self.labelGreen setText:@"GREEN"];
    [self.labelGreen setTextColor:UIColor.greenColor];
    self.labelGreen.accessibilityIdentifier = @"labelGreen";
    [self.view addSubview: self.labelGreen];
    
    self.textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(LEFT_PADDING + BUTTON_WIDTH, y, textViewWidth, COLTROL_HEIGHT)];
    [self.textFieldGreen setPlaceholder:@"0..255"];
    self.textFieldGreen.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, COLTROL_HEIGHT)];
    self.textFieldGreen.leftViewMode = UITextFieldViewModeAlways;
    [self.textFieldGreen setKeyboardType:UIKeyboardTypeNumberPad];
    [[self.textFieldGreen layer] setBorderWidth:1];
    [self.textFieldGreen setTextColor:UIColor.greenColor];
    [self.textFieldGreen setDelegate:self];
    self.textFieldGreen.returnKeyType = UIReturnKeyDone;
    self.textFieldGreen.font = [UIFont systemFontOfSize:14.0f];
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    [self.view addSubview: self.textFieldGreen];
    
    y = y + COLTROL_HEIGHT + BETWEEN_PADDING;
    
    self.labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_PADDING, y, BUTTON_WIDTH, COLTROL_HEIGHT)];
    [self.labelBlue setText:@"BLUE"];
    [self.labelBlue setTextColor:UIColor.blueColor];
    self.labelBlue.accessibilityIdentifier = @"labelBlue";
    [self.view addSubview: self.labelBlue];
    
    self.textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(LEFT_PADDING + BUTTON_WIDTH, y, textViewWidth, COLTROL_HEIGHT)];
    [self.textFieldBlue setPlaceholder:@"0..255"];
    self.textFieldBlue.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, COLTROL_HEIGHT)];
    self.textFieldBlue.leftViewMode = UITextFieldViewModeAlways;
    [self.textFieldBlue setKeyboardType:UIKeyboardTypeNumberPad];
    [[self.textFieldBlue layer] setBorderWidth:1];
    [self.textFieldBlue setTextColor:UIColor.greenColor];
    [self.textFieldBlue setDelegate:self];
    self.textFieldBlue.returnKeyType = UIReturnKeyDone;
    self.textFieldBlue.font = [UIFont systemFontOfSize:14.0f];
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    [self.view addSubview: self.textFieldBlue];
    
    y = y + COLTROL_HEIGHT + BETWEEN_PADDING;
    
    self.buttonProcess = [[UIButton alloc] initWithFrame:CGRectMake(width / 2 - BUTTON_WIDTH / 2, y, BUTTON_WIDTH, COLTROL_HEIGHT)];
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [self.buttonProcess addTarget:self action:@selector(processButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    [self.view addSubview: self.buttonProcess];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField*)textField {
    //if ([[self.labelResultColor  text] isEqualToString: @"Error"]) {
        [self.labelResultColor setText: @"Color"];
    //}
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:textField.text];
    BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
    return stringIsValid;
}

- (void)processButtonDidTap:(UIButton *)button {
    [self.view endEditing:YES];
    NSString * redVal = [self.textFieldRed text];
    NSString * greenVal = [self.textFieldGreen text];
    NSString * blueVal = [self.textFieldBlue text];
    [self.textFieldRed setText:@""];
    [self.textFieldGreen setText:@""];
    [self.textFieldBlue setText:@""];
    if (isValid(redVal) && isValid(greenVal) && isValid(blueVal)){
        int red = [redVal intValue];
        int green = [greenVal intValue];
        int blue = [blueVal intValue];
        if (red <= 255 && green <= 255 && blue <= 255 && red >= 0 && green >= 0 && blue >= 0){
            [self.viewResultColor setBackgroundColor:[UIColor colorWithRed:(red / 255.0f) green:(green / 255.0f) blue:(blue / 255.0f) alpha:1.0f]];
            [self.labelResultColor setText: [NSString stringWithFormat:@"0x%02X%02X%02X", red, green, blue]];
            return;
        }
    }
    [self.labelResultColor setText: @"Error"];
}

BOOL isValid(NSString * string) {
    if ([string isEqualToString:@""]) {
        return NO;
    }
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([string rangeOfCharacterFromSet:notDigits].location == NSNotFound) {
        return YES;
    }
    return NO;
}

@end
