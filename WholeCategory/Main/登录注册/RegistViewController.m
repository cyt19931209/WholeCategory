//
//  RegistViewController.m
//  奢易购3.0
//
//  Created by guest on 16/7/19.
//  Copyright © 2016年 cyt. All rights reserved.
//

#import "RegistViewController.h"
#import "AppDelegate.h"
#import "OnePublishingViewController.h"

@interface RegistViewController ()<UITextFieldDelegate>{

    UITextField *nameTextField;
    UITextField *phoneTextField;
    UITextField *codeTextField;
    UITextField *passwordTextField;
    UIButton *codeButton;
    NSInteger number;
    
}

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    number = 60;
    
    //背景图片
    
    UIImageView *bgImageV = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    bgImageV.image = [UIImage imageNamed:@"logobg.png"];
    
    [self.view addSubview:bgImageV];
    
    //logo
    
//    UIImageView *logoImageV = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-92, 60, 183, 140)];
//    logoImageV.image = [UIImage imageNamed:@"logo@2x.png"];
//
//    [self.view addSubview:logoImageV];
//
//    UILabel *logoLbael = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-50, logoImageV.bottom+18, 100, 30)];
//    logoLbael.text = @"3.0Beta";
//    logoLbael.textColor = [RGBColor colorWithHexString:@"#e9ebf9"];
//    logoLbael.font = [UIFont systemFontOfSize:23];
//    [self.view addSubview:logoLbael];
//    
    //账号密码
    
    UIView *midView = [[UIView alloc]initWithFrame:CGRectMake(30, kScreenHeight/2 - 108, kScreenWidth - 60, 216)];
//    
//    midView.backgroundColor = [UIColor whiteColor];
//    midView.layer.cornerRadius = 5;
//    midView.layer.masksToBounds = YES;
//    midView.layer.borderWidth = 1;
//    midView.layer.borderColor = [RGBColor colorWithHexString:@"#999999"].CGColor;
    [self.view addSubview:midView];
    
    
    
    //中间线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 8, kScreenWidth - 60, 44)];
    
    lineView.backgroundColor = [UIColor clearColor];
    lineView.layer.cornerRadius = 4;
    lineView.layer.masksToBounds = YES;
    lineView.layer.borderWidth = 1;
    lineView.layer.borderColor = [RGBColor colorWithHexString:@"d9d9d9"].CGColor;
    
    [midView addSubview:lineView];
    
    //中间线
    UIView *line1View = [[UIView alloc]initWithFrame:CGRectMake(0, lineView.bottom+10, kScreenWidth - 60, 44)];
    line1View.backgroundColor = [UIColor clearColor];
    line1View.layer.cornerRadius = 4;
    line1View.layer.masksToBounds = YES;
    line1View.layer.borderWidth = 1;
    line1View.layer.borderColor = [RGBColor colorWithHexString:@"d9d9d9"].CGColor;
    
    [midView addSubview:line1View];
    
    //中间线
    UIView *line2View = [[UIView alloc]initWithFrame:CGRectMake(0, line1View.bottom+10, kScreenWidth - 60, 44)];
    line2View.backgroundColor = [UIColor clearColor];
    line2View.layer.cornerRadius = 4;
    line2View.layer.masksToBounds = YES;
    line2View.layer.borderWidth = 1;
    line2View.layer.borderColor = [RGBColor colorWithHexString:@"d9d9d9"].CGColor;
    [midView addSubview:line2View];
    
    
    //中间线
    UIView *line3View = [[UIView alloc]initWithFrame:CGRectMake(0, line2View.bottom+10, kScreenWidth - 60,44)];
    line3View.backgroundColor = [UIColor clearColor];
    line3View.layer.cornerRadius = 4;
    line3View.layer.masksToBounds = YES;
    line3View.layer.borderWidth = 1;
    line3View.layer.borderColor = [RGBColor colorWithHexString:@"d9d9d9"].CGColor;
    [midView addSubview:line3View];

    
    //手机号和密码 店名 短信验证码
    
    //店名
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 40, 20)];
    nameLabel.text = @"店名:";
    nameLabel.textColor = [RGBColor colorWithHexString:@"#666666"];
    nameLabel.font = [UIFont systemFontOfSize:15];
    [midView addSubview:nameLabel];
    
    nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(nameLabel.right+10, nameLabel.top, 200, 20)];
    nameTextField.tag = 110;
    nameTextField.delegate = self;
    nameTextField.textColor = [RGBColor colorWithHexString:@"#6666666"];
    nameTextField.font = [UIFont systemFontOfSize:15];
    nameTextField.placeholder = @"请输入店名";
    [nameTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [midView addSubview:nameTextField];

    
    
    
    UILabel *phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, nameLabel.top+54, 40, 20)];
    phoneLabel.text = @"账号:";
    phoneLabel.textColor = [RGBColor colorWithHexString:@"#666666"];
    phoneLabel.font = [UIFont systemFontOfSize:15];
    [midView addSubview:phoneLabel];
    
    phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(phoneLabel.right+10, phoneLabel.top-2, 200, 20)];
    phoneTextField.delegate = self;
    phoneTextField.tag = 111;
    phoneTextField.textColor = [RGBColor colorWithHexString:@"#6666666"];
    phoneTextField.font = [UIFont systemFontOfSize:15];
    phoneTextField.placeholder = @"请输入手机号或者邮箱";
    [phoneTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    phoneTextField.keyboardType = UIKeyboardTypeEmailAddress;

    [midView addSubview:phoneTextField];
    
    UILabel *passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, phoneLabel.top+54, 40, 20)];
    passwordLabel.text = @"密码:";
    passwordLabel.textColor = [RGBColor colorWithHexString:@"#666666"];
    passwordLabel.font = [UIFont systemFontOfSize:15];
    [midView addSubview:passwordLabel];
    
    passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(passwordLabel.right+10, passwordLabel.top-2, 200, 20)];
    passwordTextField.delegate = self;
    passwordTextField.tag = 112;
    passwordTextField.textColor = [RGBColor colorWithHexString:@"#666666"];
    passwordTextField.secureTextEntry = YES;

    passwordTextField.font = [UIFont systemFontOfSize:15];
    
    passwordTextField.placeholder = @"请输入密码";
    [passwordTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [midView addSubview:passwordTextField];
    
    UILabel *codeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, passwordLabel.top+54, 55, 20)];
    codeLabel.text = @"验证码:";
    codeLabel.textColor = [RGBColor colorWithHexString:@"#666666"];
    codeLabel.font = [UIFont systemFontOfSize:15];
    [midView addSubview:codeLabel];
    
    codeTextField = [[UITextField alloc]initWithFrame:CGRectMake(codeLabel.right, codeLabel.top, 100, 20)];
    codeTextField.delegate = self;
    codeTextField.tag = 113;
    codeTextField.textColor = [RGBColor colorWithHexString:@"#6666666"];
    codeTextField.font = [UIFont systemFontOfSize:15];

    codeTextField.placeholder = @"请输入验证码";
    [codeTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [midView addSubview:codeTextField];

    
    codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    codeButton.frame = CGRectMake(midView.width-78, codeLabel.top , 68, 24);
    
    codeButton.layer.cornerRadius = 4;
    codeButton.layer.masksToBounds = YES;
    codeButton.layer.borderWidth = 1;
    codeButton.layer.borderColor = [RGBColor colorWithHexString:@"#949dff"].CGColor;
    
    [codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    [codeButton setTitleColor:[RGBColor colorWithHexString:@"#949dff"] forState:UIControlStateNormal];
    
    codeButton.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [codeButton addTarget:self action:@selector(codeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    codeButton.layer.cornerRadius = 5;
    codeButton.layer.masksToBounds = YES;
    
    [midView addSubview:codeButton];
    
    //中间线
//    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 45, 280, 1)];
//    lineView.backgroundColor = [RGBColor colorWithHexString:@"#ffffff"];
//    [midView addSubview:lineView];
//    
//    //中间线
//    UIView *line1View = [[UIView alloc]initWithFrame:CGRectMake(10, lineView.top+44, 280, 1)];
//    line1View.backgroundColor = [RGBColor colorWithHexString:@"#ffffff"];
//    [midView addSubview:line1View];
//    
//    //中间线
//    UIView *line2View = [[UIView alloc]initWithFrame:CGRectMake(10, line1View.top+44, 280, 1)];
//    line2View.backgroundColor = [RGBColor colorWithHexString:@"#ffffff"];
//    [midView addSubview:line2View];
//
//    
//    //中间线
//    UIView *line3View = [[UIView alloc]initWithFrame:CGRectMake(10, line2View.top+44, 280, 1)];
//    line3View.backgroundColor = [RGBColor colorWithHexString:@"#ffffff"];
//    [midView addSubview:line3View];
//    
//
    
    //注册按钮
    
    UIButton *registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registButton.frame = CGRectMake(30, midView.bottom+20, kScreenWidth - 60, 44);
    
    [registButton setBackgroundImage:[UIImage imageNamed:@"loginbtn0@2x"] forState:UIControlStateNormal];
    [registButton setBackgroundImage:[UIImage imageNamed:@"LOGINBTN@2x"] forState:UIControlStateHighlighted];

    
//    [registButton setBackgroundColor:[UIColor colorWithRed:147/256.0 green:156/256.0 blue:255/256.0 alpha:.1]];
//
//    registButton.layer.borderWidth = 1;
//    registButton.layer.borderColor = [RGBColor colorWithHexString:@"#949dff"].CGColor;
    
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    [registButton setTitleColor:[RGBColor colorWithHexString:@"#949dff"] forState:UIControlStateNormal];
    registButton.layer.cornerRadius = 4;
    registButton.layer.masksToBounds = YES;
    [registButton addTarget:self action:@selector(registButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registButton];
    
    //登录按钮
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(kScreenWidth/2-100, registButton.bottom+20, 200, 15);
    [loginButton setTitle:@"已有奢易购账号？去登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[RGBColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
}

//获取验证码
- (void)codeButtonAction:(UIButton*)bt{

    UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"提示" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    if ([phoneTextField.text isEqualToString:@""]) {
        alertV.message = @"账号不能为空";
        [alertV show];
        return;
    }
    [DataSeviece requestUrl:send_codehtml_API params:[@{@"mobile":phoneTextField.text,@"code_type":@"2"} mutableCopy] success:^(id result) {
        NSLog(@"%@",result);
        if ([result[@"result"][@"code"] isEqualToString:@"1"]) {
            //            alertV.message = @"发送成功";
            //            [alertV show];
            codeButton.userInteractionEnabled = NO;
//            [codeButton setBackgroundImage:[UIImage imageNamed:@"hqyzhui@2x"] forState:UIControlStateNormal];
            
            [codeButton setTitleColor:[RGBColor colorWithHexString:@"#b3b3b3"] forState:UIControlStateNormal];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
            
        }else{
            alertV.message = result[@"result"][@"msg"];
            [alertV show];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}

- (void)timeAction:(NSTimer*)timer{
    
    if (number == 0) {
        codeButton.userInteractionEnabled = YES;
        [timer invalidate];
        timer = nil;
        number = 60;
        [codeButton setTitleColor:[RGBColor colorWithHexString:@"#949dff"] forState:UIControlStateNormal];
        
        [codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    }else{
        number--;
        
        [codeButton setTitle:[NSString stringWithFormat:@"%ld秒",number] forState:UIControlStateNormal];
    }
    
}



//登录
- (void)loginButtonAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
//注册
- (void)registButtonAction{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"提示" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    if ([nameTextField.text isEqualToString:@""]) {
        alertV.message = @"店名不能为空";
        [alertV show];
        return;
    }else{
        [params setObject:nameTextField.text forKey:@"shop_name"];
    }
    if ([phoneTextField.text isEqualToString:@""]) {
        alertV.message = @"账号不能为空";
        [alertV show];
        return;
    }else{
        [params setObject:phoneTextField.text forKey:@"mobile"];
    }
    
    if ([codeTextField.text isEqualToString:@""]) {
        alertV.message = @"验证码不能为空";
        [alertV show];
        return;
    }else{
        [params setObject:codeTextField.text forKey:@"code"];
    }

    if ([passwordTextField.text isEqualToString:@""]) {
        alertV.message = @"密码不能为空";
        [alertV show];
        return;
    }else{
        [params setObject:passwordTextField.text forKey:@"password"];
    }

    [DataSeviece requestUrl:registerhtml_API params:params success:^(id result) {
        NSLog(@"%@",result);
        if ([result[@"result"][@"code"] isEqualToString:@"1"]) {
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            NSDictionary *dic = [NULLHandle NUllHandle:result[@"result"][@"data"]];
            
            [defaults setObject:dic forKey:@"SYGData"];
            
            [defaults synchronize];
            
            OnePublishingViewController *OnePublishingVC = [[UIStoryboard storyboardWithName:@"AddNew" bundle:nil] instantiateViewControllerWithIdentifier:@"OnePublishingViewController"];
            
            UINavigationController *naviC = [[UINavigationController alloc]initWithRootViewController:OnePublishingVC];
            
            [UIApplication sharedApplication].keyWindow.rootViewController = naviC;
            
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"PresentNotification" object:nil];
            
            
        }else{
        
            alertV.message = result[@"result"][@"msg"];
            [alertV show];

        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    for (int i = 0; i < 4; i++) {
        UITextField *textField = [self.view viewWithTag:110+i];
        [textField resignFirstResponder];
        
    }

}



@end
