/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2016 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiLiqpayPaymentProxy.h"
#import "OneClickPay.h"

@implementation TiLiqpayPaymentProxy 

-(void)pay:(id)args
{
    [[OneClickPay sharedInstance] setDataSource:self];
    [[OneClickPay sharedInstance] setDelegate:self];
    [[OneClickPay sharedInstance] pay];
}
-(void)cardList:(id)args
{
    [[OneClickPay sharedInstanceWithDataSource:self andDelegate:self] cardList];
}
-(void)history:(id)args
{
    [[OneClickPay sharedInstanceWithDataSource:self andDelegate:self] history];
}


- (NSString *)oneClickPayMerchantID {
    NSLog(@"get merchant");
    NSLog(@"get merchant %@", self.merchantID);
    return self.merchantID;
}
- (NSString *)oneClickPayPhoneNumber {
    NSLog(@"get number");
    return self.phoneNumber;
}
- (NSString *)oneClickPayAmount {
    NSLog(@"get amount");
    return self.amount;
}
- (NSString *)oneClickPayCurrency{
    NSLog(@"get Curr");
    return self.currency;
}
- (NSString *)oneClickPayDescription{
    NSLog(@"get desc");
    return self.payDescription;
}

- (NSString *)oneClickPayCardID {
    NSLog(@"get crd");
    return nil;
}

- (BOOL)oneClickPaySuppressHUD {
    NSLog(@"get hud");
    return NO;
}
- (BOOL)oneClickPayShouldRotate {
    NSLog(@"get rot");
    return NO;
}


- (void)oneClickFailedWithError:(NSError *)error{
    NSLog(@"error");
    if ([self _hasListeners:@"error"]) {
         NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSString stringWithFormat:@"%d",(int)[error code]],@"error_code",
                                [NSString stringWithFormat:@"%@",[error localizedDescription]],@"error_description",
                                nil];
        
        [self fireEvent:@"error" withObject:event];
    }
    
}
- (void)oneClickPaySuccessWithID:(NSString *)payment_id {
    NSLog(@"success");
    if ([self _hasListeners:@"success"]) {
        NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:
                               payment_id,@"payment_id",
                               nil];
        [self fireEvent:@"success" withObject:event];
    }
    
}
- (void)oneClickPayInProcessingWithID:(NSString *)payment_id {
    NSLog(@"progress");
    if ([self _hasListeners:@"progress"]) {
        NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:
                               payment_id,@"payment_id",
                               nil];
        [self fireEvent:@"progress" withObject:event];
    }
    
}

- (void)oneClickPayCardList:(NSArray *)cardList {
    NSLog(@"Not yet implemented");
    
}
- (void)oneClickPayHistory:(NSArray *)history{
     NSLog(@"Not yet implemented");
}

@end
