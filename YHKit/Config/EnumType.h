//
//  EnumType.h
//  YHKit
//
//  Created by 小河 on 2021/4/8.
//  Copyright © 2021 小河. All rights reserved.
//

#ifndef EnumType_h
#define EnumType_h

/**
 * 请求类型
 */
typedef NS_ENUM(NSUInteger, RequestMethod) {
    HRE_GET,
    HRE_POST,
    HRE_PUT,
    HRE_DELETE
};

/**
 * post请求传参方式
 */
typedef NS_ENUM(NSUInteger, PostRequestWay) {
    Post_Form,
    Post_Json
};

/**
 * api运行环境
 */
typedef NS_ENUM(NSUInteger, EnvApiHost) {
    Api_BaseURL,
    Api_FirstURL,
    Api_SecondURL
};


#endif /* EnumType_h */
