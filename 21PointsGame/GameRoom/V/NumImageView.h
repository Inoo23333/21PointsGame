//
//  NumImageView.h
//  21PointsGame
//
//  Created by user on 2020/4/22.
//  Copyright © 2020 user. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NumImageView : UIImageView

-(instancetype)initWithNumStr:(NSString *)numStr count:(NSInteger) count index:(NSInteger) index;

@end

NS_ASSUME_NONNULL_END
