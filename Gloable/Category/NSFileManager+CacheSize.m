//
//  NSFileManager+CacheSize.m
//  Hubblebubble
//
//  Created by Zhang on 2018/5/11.
//  Copyright © 2018 Zhang. All rights reserved.
//

#import "NSFileManager+CacheSize.h"

@implementation NSFileManager (CacheSize)

-(CGFloat) getCacheSize
{
    //获取文件管理器对象
    NSFileManager * fileManger = [NSFileManager defaultManager];
    
    //获取缓存沙盒路径
    NSString * cachePath =  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    //拼接缓存文件夹路径
    NSString * fileCachePath = [cachePath stringByAppendingPathComponent:@"缓存文件夹（非全路径）"];
    
    //将缓存文件夹路径赋值给成员属性(后面删除缓存文件时需要用到)
    
    //通过缓存文件路径创建文件遍历器
    NSDirectoryEnumerator * fileEnumrator = [fileManger enumeratorAtPath:fileCachePath];
    
    //先定义一个缓存目录总大小的变量
    NSInteger fileTotalSize = 0;
    
    for (NSString * fileName in fileEnumrator)
    {
        //拼接文件全路径（注意：是文件）
        NSString * filePath = [fileCachePath stringByAppendingPathComponent:fileName];
        
        //获取文件属性
        NSDictionary * fileAttributes = [fileManger attributesOfItemAtPath:filePath error:nil];
        
        //根据文件属性判断是否是文件夹（如果是文件夹就跳过文件夹，不将文件夹大小累加到文件总大小）
        if ([fileAttributes[NSFileType] isEqualToString:NSFileTypeDirectory]) continue;
        
        //获取单个文件大小,并累加到总大小
        fileTotalSize += [fileAttributes[NSFileSize] integerValue];
    }
    
    //将字节大小转为MB，然后传出去
    return fileTotalSize/1000.0/1000;
}

@end
