//
//  TabBarView.swift
//  StagingRecord
//
//  Created by 王树娴 on 12/12/2015.
//  Copyright © 2015年 A-Jay. All rights reserved.
//

import UIKit

class TabBarView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initView();

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleChange:", name: "countChange", object: nil)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        var superview:UIView = self;
        
        weak var this:TabBarView! = self;
        
        //背景
        var backgroundImageView = UIImageView()
        self.addSubview(backgroundImageView)
        backgroundImageView.image = UIImage.init(named: "tabbar_background")?.stretchableImageWithLeftCapWidth(2, topCapHeight: 0)

//        [backgroundImageView makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(ScreenWidth);
//        make.height.equalTo(@49);
//        
//        make.top.equalTo(superview.top).offset(@0);
//        make.left.equalTo(superview.mas_left);
//        }];
//
//        
//        //广场
//        UIButton *squareButton = [UIButton new];
//        squareButton.backgroundColor = [UIColor clearColor];
//        [squareButton setImage: [UIImage imageNamed:@"tabbar_square_default"] forState:UIControlStateNormal];
//        [squareButton setImage:[UIImage imageNamed:@"tabbar_square_highlighted"] forState:UIControlStateHighlighted];
//        
//        squareButton.tag = 2000;
//        
//        [squareButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self addSubview:squareButton];
//        
//        
//        
//        MyLabel *squareLabel = [MyLabel new];
//        squareLabel.backgroundColor = [UIColor clearColor];
//        squareLabel.text = NSLocalizedString(@"广场", @"广场");
//        squareLabel.font = kSize12;
//        squareLabel.textColor = kColor4;
//        squareLabel.textAlignment = NSTextAlignmentCenter;
//        squareLabel.tag = 3000;
//        [self addSubview:squareLabel];
//        squareLabel.touchBlock = ^(){
//            [this selectedLabel:0];
//        };
//        
//        
//        
//        [squareButton makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(kButtonWidth);
//            make.height.equalTo(kButtonHeight);
//            
//            make.top.equalTo(superview.top).offset(@5);
//            make.left.equalTo(superview.mas_left).offset(kPadding);
//            }];
//        
//        [squareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(squareButton.mas_width);
//            make.height.equalTo(@12);
//            
//            make.top.equalTo(squareButton.mas_bottom).offset(@2);
//            make.left.equalTo(squareButton.mas_left);
//            }];
//        
//        
//        
//        
//        //节目
//        UIButton *programButton = [UIButton new];
//        programButton.backgroundColor = [UIColor clearColor];
//        [programButton setImage: [UIImage imageNamed:@"tabbar_program_default"] forState:UIControlStateNormal];
//        [programButton setImage:[UIImage imageNamed:@"tabbar_program_highlighted"] forState:UIControlStateHighlighted];
//        
//        programButton.tag = 2001;
//        
//        [programButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:programButton];
//        
//        MyLabel *programLabel = [MyLabel new];
//        programLabel.backgroundColor = [UIColor clearColor];
//        programLabel.text = NSLocalizedString(@"节目", @"节目");
//        programLabel.font = kSize12;
//        programLabel.textColor = kColor4;
//        programLabel.textAlignment = NSTextAlignmentCenter;
//        programLabel.tag = 3001;
//        [self addSubview:programLabel];
//        programLabel.touchBlock = ^(){
//            [this selectedLabel:1];
//        };
//        
//        [programButton makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(squareButton.mas_width);
//            make.height.equalTo(squareButton.mas_height);
//            
//            make.top.equalTo(squareButton.mas_top);
//            
//            make.left.equalTo(squareButton.mas_right).offset(kPadding2);
//            
//            }];
//        
//        [programLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(programButton.mas_width);
//            make.height.equalTo(@12);
//            
//            make.top.equalTo(programButton.mas_bottom).offset(@2);
//            make.left.equalTo(programButton.mas_left);
//            }];
//        
//        
//        
//        
//        //消息
//        UIButton *messageButton = [UIButton new];
//        messageButton.backgroundColor =[UIColor clearColor];
//        [messageButton setImage: [UIImage imageNamed:@"tabbar_message_default"] forState:UIControlStateNormal];
//        [messageButton setImage:[UIImage imageNamed:@"tabbar_message_highlighted"] forState:UIControlStateHighlighted];
//        
//        messageButton.tag = 2002;
//        
//        [messageButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:messageButton];
//        
//        MyLabel *messageLabel = [MyLabel new];
//        messageLabel.backgroundColor = [UIColor clearColor];
//        messageLabel.text = NSLocalizedString(@"消息", @"消息");
//        messageLabel.font = kSize12;
//        messageLabel.textColor = kColor4;
//        messageLabel.textAlignment = NSTextAlignmentCenter;
//        messageLabel.tag = 3002;
//        [self addSubview:messageLabel];
//        messageLabel.touchBlock = ^(){
//            [this selectedLabel:2];
//        };
//        
//        [messageButton makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(squareButton.mas_top);
//            make.width.equalTo(squareButton.mas_width);
//            make.height.equalTo(squareButton.mas_height);
//            make.left.equalTo(programButton.mas_right).offset(kPadding2);
//            }];
//        
//        [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(messageButton.mas_width);
//            make.height.equalTo(@12);
//            
//            make.top.equalTo(messageButton.mas_bottom).offset(@2);
//            make.left.equalTo(messageButton.mas_left);
//            }];
//        //新消息数量
//        _countLabel = [[MyLabel alloc] initWithCircleWidth:kCountLabelWidth];
//        _countLabel.backgroundColor = kColor1;
//        [self addSubview:_countLabel];
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        NSString *unreadCount = [defaults objectForKey:[NSString stringWithFormat:@"%@unreadCount",[MRDao getMember].token]];
//        if ([MRDao getMember]) {
//            if ([unreadCount isEqualToString:@"0"] || unreadCount == nil) {
//                _countLabel.hidden = YES;
//                _countLabel.font = kSize9;
//            } else {
//                _countLabel.hidden = NO;
//                if ([unreadCount integerValue] > 99) {
//                    _countLabel.text = @"99+";
//                    _countLabel.font = [UIFont boldSystemFontOfSize:6];
//                } else {
//                    _countLabel.text = unreadCount;
//                    _countLabel.font = kSize9;
//                }
//                
//            }
//        } else {
//            _countLabel.hidden = YES;
//            _countLabel.font = kSize9;
//        }
//        _countLabel.textColor = kColor2_100;
//        _countLabel.textAlignment = NSTextAlignmentCenter;
//        [_countLabel makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(kCountLabelWidth);
//            make.height.equalTo(kCountLabelWidth);
//            
//            make.top.equalTo(messageButton.mas_top).offset(-2);
//            make.left.equalTo(messageButton.centerX).offset(7);
//            }];
//        _countLabel.userInteractionEnabled = NO;
//        
//        
//        
//        
//        //我(会员)
//        UIButton *memberButton = [UIButton new];
//        memberButton.backgroundColor = [UIColor clearColor];
//        [memberButton setImage: [UIImage imageNamed:@"tabbar_member_default"] forState:UIControlStateNormal];
//        [memberButton setImage:[UIImage imageNamed:@"tabbar_member_highlighted"] forState:UIControlStateHighlighted];
//        
//        memberButton.tag = 2003;
//        
//        [memberButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self addSubview:memberButton];
//        
//        MyLabel *memberLabel = [MyLabel new];
//        memberLabel.backgroundColor = [UIColor clearColor];
//        memberLabel.text = NSLocalizedString(@"我", @"我");
//        memberLabel.font = kSize12;
//        memberLabel.textColor = kColor4;
//        memberLabel.textAlignment = NSTextAlignmentCenter;
//        memberLabel.tag = 3003;
//        [self addSubview:memberLabel];
//        memberLabel.touchBlock = ^(){
//            [this selectedLabel:3];
//        };
//        
//        
//        [memberButton makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(squareButton.mas_width);
//            make.height.equalTo(squareButton.mas_height);
//            
//            make.top.equalTo(squareButton.mas_top);
//            make.right.equalTo(ScreenWidth).offset(-kPadding);
//            
//            
//            }];
//        
//        [memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(memberButton.mas_width);
//            make.height.equalTo(@12);
//            
//            make.top.equalTo(memberButton.mas_bottom).offset(@2);
//            make.left.equalTo(memberButton.mas_left);
//            }];
    }

    func handleChange(info:NSNotification){
        
//        if ([MRDao getMember]) {
//            if ([[info object] isEqualToString:@"0"] || [info object] == nil) {
//                _countLabel.hidden = YES;
//                _countLabel.font = kSize9;
//            } else {
//                _countLabel.hidden = NO;
//                if ([[info object] integerValue] > 99) {
//                    _countLabel.text = @"99+";
//                    _countLabel.font = [UIFont boldSystemFontOfSize:6];
//                } else {
//                    _countLabel.text = [info object];
//                    _countLabel.font = kSize9;
//                }
//                
//            }
//        } else {
//            _countLabel.font = kSize9;
//            _countLabel.hidden = YES;
//        }
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
