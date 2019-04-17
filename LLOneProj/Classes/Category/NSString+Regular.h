//
//  NSString+Regular.h
//  TopjetPicking
//
//  Created by lish on 2017/8/7.
//  Copyright © 2017年 ShangHai Topjet Information & Technology Co. Ltd. All rights reserved.
//正则表达式

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,CHECKPASSWORD){
    
    PASSWORD_EQUAL_NUMBER,            //密码全是相同数字
    PASSWORD_CONTINUOUS_NUMBER,       //连续数字
    PASSWORD_EQUAL_CHARS,             //密码全是相同字母
    PASSWORD_RIGHT,                   //密码格式正确
    
};

@interface NSString (Regular)

/**
 检查是否为正确身份证

 @return yes/no
 */
- (BOOL)checkIdentityCard;

/**
 检查是否为正确手机号

 @return yes/ no
 */
- (BOOL)checkPhoneNumber;

/**
 检查密码格式 6-16位数字或字母

 @return 符合返回YES
 */
- (BOOL)checkPasswordFormart;



/**
 检查密码格式 6-16位

 @return return value description
 */
- (BOOL)checkNormalPasswordFormart;
/**
 检查是否为正确车牌号

 @return yes/ no

 */
- (BOOL)checkNumberPlate;


/**
 *  检查是否为正确的密码 6-16位字母或数字组合 不连续不相同不单纯数字 不单纯字母
 *
 *  @param completeBlock block
 */
- (void)checkPasswordCompleteBlock:(void(^)(CHECKPASSWORD code))completeBlock;

/**
 6位纯数字验证码

 @param code 验证码
 @return yes/no
 */
- (BOOL)checkUserCode;

/**
 是否为纯数字

 @return yes/no    纯数字返回Yes
 */
- (BOOL)checkPureNumber;

/**
 是否为纯字母

 @param charsCode 字符code
 @return yes/no   纯字母返回Yes
 */
+ (BOOL)checkPureChars:(NSString *)charsCode;

/**
 是否为相同字母/数字

 @param charsCode 字符code
 @return yes/no   全部相同返回NO
 */
+ (BOOL)checkEqualChars:(NSString *)charsCode;

/**
 判断是否为连续数字

 @param numberStr 字符串
 @return 如果是连续的数字返回 YSE 
 */
+ (BOOL)checkContinuousNumber:(NSString *)numberStr;

/**
 是否符合设定字符的长度

 @param length 设定字符长度
 @param chars 字符
 @return yes/no
 */
+ (BOOL)checkNumberLength:(NSInteger)length chars:(NSString *)chars;

/**
 是否符合运费价格规则
 @return yes/no
 */
- (BOOL)isMatchingFreight;


/**
 是否为正确的URL

 @return return value description
 */
- (BOOL)isCorrectURL;



@end
