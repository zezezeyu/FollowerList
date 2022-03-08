//
//  ViewController.swift
//  FollowerList2
//
//  Created by ByteDance on 2022/3/6.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var fullScreenSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.init(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 3
        layout.itemSize = CGSize(width: CGFloat(fullScreenSize.width) - 2.0, height: fullScreenSize.height/12)
        let myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 20, width: fullScreenSize.width, height: fullScreenSize.height - 20), collectionViewLayout: layout)
            
        myCollectionView.register(FollowerListCell.self, forCellWithReuseIdentifier: "Cell")
        
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        self.view.addSubview(myCollectionView)
    }
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FollowerListCell
        let index =  indexPath.item  % 4 + 1
        cell.myimageView.image = UIImage(named: "0\(index)")
        cell.mytitleLabel.text = "我是标题\(indexPath.item + 1)"
        cell.mycententLabel.text = "我是内容\(indexPath.item + 1)"
        return cell
    }
    // 有几个 section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    // 點選 cell 後執行的動作
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("你选择了第 \(indexPath.section + 1) 组的")
        print("第 \(indexPath.item + 1) 张图片")
    }

}

