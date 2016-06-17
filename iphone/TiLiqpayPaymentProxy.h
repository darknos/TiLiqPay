/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2016 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiProxy.h"
#import "OneClickPay.h"

@interface TiLiqpayPaymentProxy : TiProxy <OneClickPayDataSource, OneClickPayDelegate>{

}
@property(copy) NSString* merchantID;
@property(copy) NSString* phoneNumber;
@property(copy) NSString* amount;
@property(copy) NSString* currency;
@property(copy) NSString* payDescription;



@end
