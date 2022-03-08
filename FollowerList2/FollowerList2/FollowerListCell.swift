//
//  FollowerListCell.swift
//  FollerList
//
//  Created by ByteDance on 2022/3/6.
//

import UIKit
import SnapKit

class FollowerListCell: UICollectionViewCell {
    var myimageView: UIImageView!
    var mytitleLabel: UILabel!
    var mycententLabel : UILabel!
    var mybutton :UIButton!
    var formView : UIView!
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        //每一栏的高度
        let formHeight = UIScreen.main.bounds.height / 12
        //let formWidth = UIScreen.main.bounds.width / 5
        self.formView = UIView()
        self.formView.layer.borderWidth = 0.5
        self.formView.layer.borderColor = UIColor.lightGray.cgColor
        self.formView.backgroundColor = UIColor.white
        self.formView.layer.cornerRadius = 2
        self.addSubview(self.formView)
        //外表框的设定
        self.formView.snp.makeConstraints { make in
            make.left.equalTo(2)
            make.right.equalTo(-2)
            make.height.equalTo(formHeight)
        }
        //图像的设定
        myimageView = UIImageView()
        //myimageView.backgroundColor = .yellow
        formView.addSubview(myimageView)
        myimageView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(formView).inset(2)
            make.width.equalTo(formHeight)
        }
        myimageView.contentMode =  .scaleToFill
        //设置遮罩
        myimageView.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        myimageView.layer.cornerRadius = formHeight/2
        
        //标题标签的设定
        mytitleLabel = UILabel()
        mytitleLabel.backgroundColor = .orange
        formView.addSubview(mytitleLabel)
        mytitleLabel.snp.makeConstraints { make in
            make.top.equalTo(2)
            make.height.equalTo(formHeight * 0.65 - 5)
            make.left.equalTo(myimageView.snp.right).offset(2)
            make.right.equalTo(-60)
        }
        mytitleLabel.font = .boldSystemFont(ofSize: 20)
        mytitleLabel.textColor = .red
        
        
        //内容标签的设定
        mycententLabel = UILabel()
        mycententLabel.backgroundColor = .green
        formView.addSubview(mycententLabel)
        mycententLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-2)
            make.height.equalTo(formHeight * 0.35 - 5)
            make.left.equalTo(myimageView.snp.right).offset(2)
            make.right.equalTo(-60)
        }
        mycententLabel.font = .systemFont(ofSize: 16)
        mycententLabel.textColor = .black
        
        //按钮的设置
        mybutton = UIButton(type: .system)
        mybutton.setTitle("关注", for: .normal)
        mybutton.setTitleColor(.green, for: .normal)
        mybutton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        mybutton.backgroundColor = .lightGray
        formView.addSubview(mybutton)
        mybutton.snp.makeConstraints { make in
            make.centerY.equalTo(formView)
            make.height.equalTo(formHeight/2)
            make.right.equalTo(-2)
            make.left.equalTo(mytitleLabel.snp.right).offset(2)
        }
        mybutton.addTarget(self, action: #selector(click), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func click(myButton : UIButton){
        let tag = myButton.currentTitle
        if tag == "关注" {
            myButton.setTitle("未关注", for: .normal)
        } else if tag == "未关注" {
            myButton.setTitle("关注", for: .normal)
        }
    }
    
}
