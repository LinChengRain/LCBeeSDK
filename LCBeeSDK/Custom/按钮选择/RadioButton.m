//
//  RadioButton.m
//  RadioButton
//
//  Created by ohkawa on 11/03/23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RadioButton.h"

@interface RadioButton()
-(void)defaultInit:(NSString *)direction;
-(void)otherButtonSelected:(id)sender;
-(void)handleButtonTap:(id)sender;
@end

@implementation RadioButton

@synthesize groupId=_groupId;
@synthesize index=_index;
@synthesize tab=_tab;
@synthesize sign;
@synthesize clicks;


static const NSUInteger kRadioButtonWidth=22;
static const NSUInteger kRadioButtonHeight=22;

static const NSUInteger kRadioButtonWidth2=27;
static const NSUInteger kRadioButtonHeight2=27;

static NSMutableArray *rb_instances=nil;
static NSMutableDictionary *rb_instancesDic=nil;  // 识别不同的组
static NSMutableDictionary *rb_observers=nil;
#pragma mark - Observer

+(void)addObserverForGroupId:(NSString*)groupId observer:(id)observer{
    if(!rb_observers){
        rb_observers = [[NSMutableDictionary alloc] init];
    }
    
    if ([groupId length] > 0 && observer) {
        [rb_observers setObject:observer forKey:groupId];
        // Make it weak reference
    }
}

#pragma mark - Manage Instances

+(void)registerInstance:(RadioButton*)radioButton withGroupID:(NSString *)aGroupID{

    if(!rb_instancesDic){
        rb_instancesDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    }
    
    if ([rb_instancesDic objectForKey:aGroupID]) {
        [[rb_instancesDic objectForKey:aGroupID] addObject:radioButton];
        [rb_instancesDic setObject:[rb_instancesDic objectForKey:aGroupID] forKey:aGroupID];
    }else {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:16];
        [arr addObject:radioButton];
        [rb_instancesDic setObject:arr forKey:aGroupID];
    }
}

#pragma mark - Class level handler

+(void)buttonSelected:(RadioButton*)radioButton{
    
    // Notify observers
    if (rb_observers) {
        id observer= [rb_observers objectForKey:radioButton.groupId];
        
        if(observer && [observer respondsToSelector:@selector(radioButtonSelectedAtIndex:inGroup:)]){
            [observer radioButtonSelectedAtIndex:radioButton.index inGroup:radioButton.groupId];
        }
    }
    
    // Unselect the other radio buttons

    // 初始化按钮数组
    rb_instances = [rb_instancesDic objectForKey:radioButton.groupId];
    
    if (rb_instances) {
        for (int i = 0; i < [rb_instances count]; i++) {
            RadioButton *button = [rb_instances objectAtIndex:i];
            if (![button isEqual:radioButton]) {
                [button otherButtonSelected:radioButton];
            }
        }
    }
}

#pragma mark - Object Lifecycle

-(id)initWithGroupId:(NSString*)groupId index:(NSUInteger)index tab:(NSString *)tab{
    self = [self init];
    if (self) {
        _groupId = groupId;
        _index = index;
        _tab = tab;
        sign=tab;
        [self defaultInit:sign];  // 移动至此
    }
    return  self;
}

- (id)init{
    self = [super init];
    clicks=1;
    if (self) {
 //       [self defaultInit];
    }
    return self;
}


- (void)dealloc
{

}


#pragma mark - Set Default Checked

- (void) setChecked:(BOOL)isChecked
{
   
    if (isChecked) {
        
        [_button setSelected:YES];
    }else {
        [_button setSelected:NO];
    }
}



#pragma mark - Tap handling

-(void)handleButtonTap:(id)sender{
    
    [_button setSelected:YES];
    
    
   
    
    
    [RadioButton buttonSelected:self];
}

-(void)otherButtonSelected:(id)sender{
    // Called when other radio button instance got selected
    
    
        
        if(_button.selected){
            [_button setSelected:NO];
        }
    
    /*if(_button.selected){
        [_button setSelected:NO];        
    }*/
}

-(void)cancleChecked:(id)sender{
    
    //[RadioButton buttonSelected:self];
}

#pragma mark - RadioButton init
/*
-(void)defaultInit:(NSString *)direction{
    // Setup container view
    // Customize UIButton
    sign=direction;
    
    if ([direction isEqualToString:@"1"]) {
        
        self.frame = CGRectMake(0, 0, kRadioButtonWidth2, kRadioButtonHeight2);
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0,kRadioButtonWidth2, kRadioButtonHeight2);
        _button.adjustsImageWhenHighlighted = NO;
        
        [_button setImage:[UIImage imageNamed:@"button_pay_zhifubao_1"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"button_pay_zhifubao_2"] forState:UIControlStateSelected];
    }else if ([direction isEqualToString:@"0"]) {
        self.frame = CGRectMake(0, 0, kRadioButtonWidth2, kRadioButtonHeight2);
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0,kRadioButtonWidth2, kRadioButtonHeight2);
        _button.adjustsImageWhenHighlighted = NO;
        
        [_button setImage:[UIImage imageNamed:@"button_pay_coins1"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"button_pay_coins2"] forState:UIControlStateSelected];
        
    }
    
    else{
        
        self.frame = CGRectMake(0, 0, kRadioButtonWidth, kRadioButtonHeight);
        
        // Customize UIButton
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0,kRadioButtonWidth, kRadioButtonHeight);
        _button.adjustsImageWhenHighlighted = NO;
        
        [_button setImage:[UIImage imageNamed:@"note_gray.png"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"note_red.png"] forState:UIControlStateSelected];
    }
   
    
    
    
    [_button addTarget:self action:@selector(handleButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_button];
    
 //   [RadioButton registerInstance:self];
    
    // update follow:
    [RadioButton registerInstance:self withGroupID:self.groupId];

}
*/

-(void)defaultInit:(NSString *)direction{
    // Setup container view
    // Customize UIButton
    sign=direction;
    
    if ([direction isEqualToString:@"1"]) {
        
        self.frame = CGRectMake(0, 0, kRadioButtonWidth2, kRadioButtonHeight2);
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0,kRadioButtonWidth2, kRadioButtonHeight2);
        _button.adjustsImageWhenHighlighted = NO;
        
        [_button setImage:[UIImage imageNamed:@"button_pay_zhifubao_1"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"button_pay_zhifubao_2"] forState:UIControlStateSelected];
    }else if ([direction isEqualToString:@"0"]) {
        self.frame = CGRectMake(0, 0, kRadioButtonWidth2, kRadioButtonHeight2);
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0,kRadioButtonWidth2, kRadioButtonHeight2);
        _button.adjustsImageWhenHighlighted = NO;
        
        [_button setImage:[UIImage imageNamed:@"button_pay_coins1"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"button_pay_coins2"] forState:UIControlStateSelected];
        
    }
    
    else{
        
        self.frame = CGRectMake(0, 0, kRadioButtonWidth, kRadioButtonHeight);
        
        // Customize UIButton
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0,kRadioButtonWidth, kRadioButtonHeight);
        _button.adjustsImageWhenHighlighted = NO;
        
        [_button setImage:[UIImage imageNamed:@"note_gray.png"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"note_red.png"] forState:UIControlStateSelected];
    }
    
    
    
    
    [_button addTarget:self action:@selector(handleButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_button];
    
    //   [RadioButton registerInstance:self];
    
    // update follow:
    [RadioButton registerInstance:self withGroupID:self.groupId];
    
}


@end
