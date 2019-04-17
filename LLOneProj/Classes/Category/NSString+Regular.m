//
//  NSString+Regular.m
//  TopjetPicking
//
//  Created by lish on 2017/8/7.
//  Copyright © 2017年 ShangHai Topjet Information & Technology Co. Ltd. All rights reserved.
//

#import "NSString+Regular.h"

@implementation NSString (Regular)

- (BOOL)checkIdentityCard {
    
    if (![self isNotBlank]) {
        return NO;
    }
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL)checkPhoneNumber {
    
    if (![self isNotBlank]) {
        
        return NO;
    }
    
    NSString *MOBILE = @"134[0-8]\\d{7}$|^13[^4]\\d{8}$|^14[5-9]\\d{8}$|^15[^4]\\d{8}$|^16[6,8]\\d{8}$|^17[0-8]\\d{8}$|^18[\\d]{9}$|^19[8,9]\\d{8}$";
    NSPredicate *regexTestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MOBILE];
    
    return [regexTestMobile evaluateWithObject:self];
}

- (BOOL)checkPasswordFormart {
    
    NSString * regex = @"[0-9A-Za-z] {6,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL result = [pred evaluateWithObject:self];

    return result;
}

- (BOOL)checkNormalPasswordFormart {
    
    
    BOOL result = NO;
    if (self.length >=6 && self.length <= 16) {
        result = YES;
    }
    return result;
}

- (void)checkPasswordCompleteBlock:(void(^)(CHECKPASSWORD code))completeBlock{
    
//    PASSWORD_EQUAL_NUMBER,            //密码全是相同数字
//    PASSWORD_CONTINUOUS_NUMBER,       //连续数字
//    PASSWORD_EQUAL_CHARS,             //密码全是相同字母
//    PASSWORD_RIGHT,                   //密码格式正确

     //密码全是字母
    if ([NSString checkPureChars:self]) {
        //密码是相同字母
        if (![NSString checkEqualChars:self]) {
            
            completeBlock(PASSWORD_EQUAL_CHARS);
            
        }else{
            completeBlock(PASSWORD_RIGHT);
        }
    }
    //密码全是数字
    else if ([self checkPureNumber]){
        //相同数字
        if (![NSString checkEqualChars:self]) {
           completeBlock(PASSWORD_EQUAL_NUMBER);
        }
        //连续数字
        else if ([NSString checkContinuousNumber:self]){
            
            completeBlock(PASSWORD_CONTINUOUS_NUMBER);
        }else{
            completeBlock(PASSWORD_RIGHT);
        }
    }
    //格式正确
    else{
       completeBlock(PASSWORD_RIGHT);
    }
}

- (BOOL)checkNumberPlate {
    NSString *carRegex = @"^[A-Z]{1}[A-Z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    BOOL result = [carTest evaluateWithObject:self];
    
    return result;
}

- (BOOL)checkUserCode {
    
    BOOL flag;
    
    if (self.length <= 0) {
        
        flag = NO;
        
        return flag;
        
    }
    NSString *regex2 = @"^\\d{6}$";
    
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [identityCardPredicate evaluateWithObject:self];
}


- (BOOL)checkPureNumber {
    
    BOOL flag;
    
    if (self.length <= 0) {
        
        flag = NO;
        
        return flag;
        
    }
    NSString *regex2 = @"^[0-9]*$";
    
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [identityCardPredicate evaluateWithObject:self];
}


+ (BOOL)checkPureChars:(NSString *)charsCode {
    
  
    NSString *regex2 = @"^[A-Za-z]+$";
    
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [identityCardPredicate evaluateWithObject:charsCode];
}

+ (BOOL)checkEqualChars:(NSString *)charsCode {
    
    
    NSMutableSet  *charsSet = [NSMutableSet set];
    for (int i = 0; i< charsCode.length; i++) {
        NSString *chars = [charsCode substringWithRange:NSMakeRange(i, 1)];
        [charsSet addObject:chars];
        
    }
    
    if (charsSet.count == 1) {
        
        return NO;
    }else {
        return YES;
    }
    
}

//不连续返回NO 连续返回yes
+ (BOOL)checkContinuousNumber:(NSString *)numberStr {
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i<numberStr.length; i++) {
        
        NSString *chars = [numberStr substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:chars];
    }
    BOOL flag = NO;
    for(int i = 0;i < arr.count-1; i++){
        if([arr[i] intValue] != [arr[i+1] intValue]-1 && [arr[i] intValue] != [arr[i+1] intValue]-1){
            flag=NO;
            break;
            
        }else
            flag=YES;
        continue;
        
    }
    
    return flag;
}


+ (BOOL)checkNumberLength:(NSInteger)length chars:(NSString *)chars {
    
    
    if (![chars isNotBlank]) {
        
        return NO;
    }else if (chars.length == length){
        
        return YES;
    }else {
        return NO;
    }
   
}
- (BOOL)isMatchingFreight {
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    if (self.doubleValue < 0) {
        flag = NO;
        return flag;
    }
    if (self.doubleValue == 0) {
        flag = YES;
        return flag;
    }
    NSString *regex2 = @"^(([1-9][0-9]*)|(([0]\\.\\d{1,2}|[1-9][0-9]*\.\\d{1,2})))$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [identityCardPredicate evaluateWithObject:self];
    
}

- (BOOL)isCorrectURL {
    if (![self isNotBlank] || ![self containsString:@"http"]) {
         return NO;
    }else{
        return YES;
    }
}
@end
