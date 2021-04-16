//
//  InterfaceApiDelegate.h
//  YHKit
//
//  Created by 小河 on 2021/4/8.
//  Copyright © 2021 小河. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@protocol InterfaceApiDelegate <NSObject>

@optional
/**
 * 请求成功的代理
 */
-(void)interfaceExcuteSuccess:(id)retObj
                      apiName:(NSString*)ApiName
                      apiFlag:(NSString*)ApiFlag;

/**
 * 请求失败的代理
 */
-(void)interfaceExcuteError:(NSError*)error
                    apiName:(NSString*)ApiName;

/**
 * 请求后的Block回调
 * httpRequestSuccessBlock 成功的block
 * httpRequestfailureBlock 失败的block
 */
typedef void(^httpRequestSuccessBlock)(id responseObject);
typedef void(^httpRequestfailureBlock)(NSError *error);
typedef void(^httpRequestFormDataBlock)(id<AFMultipartFormData> formData);

@end

NS_ASSUME_NONNULL_END

