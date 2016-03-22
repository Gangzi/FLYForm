//
//  FLYValidateDecimals.m
//  Created by Tony Lee on 15/10/26.

#import "FLYValidateDecimals.h"

#import "FLYValidateMobile.h"
#import "FLYValidateMust.h"

@implementation FLYValidateDecimals


/**
 字段验证
 **/
-(BOOL)doValidateWithCellModel:(FLYCellModel *)cellModel{
    FLYValidateMust *must = [[FLYValidateMust alloc] init];
    if (![must doValidateWithCellModel:cellModel]) {
        return  YES;
    }
    NSString * regex = @"^(-?\\d+)(\\.\\d+)?$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject: cellModel.fieldValue.trim];
}

/**
 错误信息
 **/
-(NSString *)errorMsgWithCellModel:(FLYCellModel *)cellModel{
    return  [NSString stringWithFormat:@"'%@'只能为小数",cellModel.title];
}

-(void)setup:(FLYCellModel *)cellModel andField:(id)aField{
    
}


@end
