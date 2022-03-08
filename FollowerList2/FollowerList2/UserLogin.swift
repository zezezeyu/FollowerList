//
//  UserLogin.swift
//  FollowerList2
//
//  Created by ByteDance on 2022/3/7.
//

import UIKit
import SnapKit
class UserLoginViewController: UIViewController,UITextFieldDelegate{
    
    var txtUser: UITextField!   //用户名
    var txtPwd: UITextField!    //密码
    var btnLogin: UIButton!     //登录按钮
    var formView: UIView!       //登陆框视图
    var horizontalLine: UIView! //分隔线
    
    var topConstraint: Constraint? //登录框距顶部距离约束
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取屏幕尺寸
        //let fullScreenSize = UIScreen.main.bounds.size
        self.view.backgroundColor = .white
        //登录框的背景
        //登录框高度
        let formViewHeight = 90
        formView = UIView()
        formView.layer.borderColor = UIColor.orange.cgColor
        formView.layer.borderWidth = 1
        formView.layer.cornerRadius = 8
        formView.backgroundColor = .white
        self.view.addSubview(formView)
        formView.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(formViewHeight)
            topConstraint = make.centerY.equalTo(self.view).constraint
        }
        
        //分隔线
        horizontalLine = UIView()
        horizontalLine.backgroundColor = .lightGray
        formView.addSubview(horizontalLine)
        horizontalLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.centerY.equalTo(formView)
        }
        
        //用户名图标
        let userImage = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        userImage.image = UIImage(named: "username")
        //密码图标
        let pwdImage = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        pwdImage.image = UIImage(named: "password")
        
        //用户名输入框
        txtUser = UITextField()
        txtUser.delegate = self
        txtUser.placeholder = "用户名"
        txtUser.tag = 100
        txtUser.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        txtUser.leftViewMode = .always
        txtUser.returnKeyType = .default
        txtUser.leftView!.addSubview(userImage)
        
        formView.addSubview(txtUser)
        
        txtUser.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.centerY.equalTo(self.formView).offset(-formViewHeight/4)
        }
        
        //密码输入框
        txtPwd = UITextField()
        txtPwd.delegate = self
        txtPwd.placeholder = "密码"
        txtPwd.tag = 101
        txtPwd.leftView = UIView(frame:CGRect(x: 0, y: 0, width: 44, height: 44))
        txtPwd.leftViewMode =  .always
        txtPwd.returnKeyType = .next
        txtPwd.leftView!.addSubview(pwdImage)
       
        formView.addSubview(txtPwd)
        
        txtPwd.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.centerY.equalTo(self.formView).offset(formViewHeight/4)
        }
        
        //登录按钮
        btnLogin = UIButton()
        btnLogin.setTitle("Login", for: .normal)
        btnLogin.setTitleColor(.black, for: .normal)
        btnLogin.layer.cornerRadius = 8
        btnLogin.backgroundColor = .yellow
        btnLogin.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        self.view.addSubview(btnLogin)
        btnLogin.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.top.equalTo(self.formView.snp.bottom).offset(20)
            make.right.equalTo(-15)
            make.height.equalTo(44)
        }
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.topConstraint?.update(offset: -125)
            self.view.layoutIfNeeded()
        })
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let tag = textField.tag
        switch tag {
        case 100:
            self.txtPwd.becomeFirstResponder()
        case 101:
            loginEvent()
        default:
            print(textField.text!)
        }
        return true
    }
    @objc func loginEvent() {
        //收起键盘
        self.view.endEditing(true)
        //视图约束恢复到初始设置
        UIView.animate(withDuration: 1) {
            self.topConstraint?.update(offset: 0)
            self.view.layoutIfNeeded()
        }
        //对登陆进行判断
        let username = self.txtUser.text!
        let password = self.txtPwd.text!
        txtUser.resignFirstResponder() //通知此对象，要求其在其窗口中放弃其作为第一响应者的状态
        txtPwd.resignFirstResponder()
        
        //如果用户名和密码都正确的话
        if username == "123" && password=="123"{
            //取得id=“Main”的Storyboard的实例
            let mainViewController = ViewController()
            //mainViewController.message = "登陆成功"
            self.present(mainViewController, animated: true, completion: nil)
            self.dismiss(animated: true , completion: nil)
            
            //let mainBoard:UIStoryboard! = UIStoryboard(name: "Main", bundle: nil)
            //取得identifier = “vcMain”的ViewController
            //这里需要我们自己去 Main.storyboard 里面设置
            //let VCMain = mainBoard!.instantiateViewController(withIdentifier: "vcMain");
            //UIApplication.shared.windows[0].rootViewController = VCMain
        }
        else{  //登录不成功
            //定义一个警告窗口
            let p = UIAlertController(title: "登录失败", message: "用户名或密码错误", preferredStyle: .alert)
            
            //点击确定后，自动将密码清零
            p.addAction(UIAlertAction(title: "确定", style: .default, handler: {(act:UIAlertAction)in self.txtPwd.text=""}))
            
            //呈现出错误窗口(模态)
            present(p,animated: false,completion: nil)
        }
    }

}
