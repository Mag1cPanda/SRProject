//
//  TestSwiftViewController.swift
//  SRProject
//
//  Created by longrise on 2018/9/28.
//  Copyright © 2018年 longrise. All rights reserved.
//

import UIKit

class TestSwiftViewController: BaseViewController ,MinScrollMenuDelegate{

    let screenH = UIScreen.main.bounds.size.height
    
    let screenW = UIScreen.main.bounds.size.width
    
    fileprivate var _menu:MinScrollMenu!
    fileprivate var menu:MinScrollMenu {
        get {
            guard _menu == nil else {
                return _menu
            }
            
            _menu = MinScrollMenu.init(frame: CGRect(x: 0, y: 100, width: screenW, height: 100))
            _menu.delegate = self
            return _menu
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "Swift & OC"
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.view.addSubview(self.menu)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - MinScrollMenuDelegate
    func number(ofMenuCount menu: MinScrollMenu!) -> Int {
        return 10
    }
    
    func scrollMenu(_ menu: MinScrollMenu!, widthForItemAt index: Int) -> CGFloat {
        return 80
    }
    
    func scrollMenu(_ menu: MinScrollMenu, itemAt index: Int) -> MinScrollMenuItem {
        var item = menu.dequeueItem(withIdentifer: "textItem")
        
        if item == nil {
            item = MinScrollMenuItem(type: .TextType, reuseIdentifier: "textItem")
        }
        item!.textLabel.text = "\(index)"
        item!.textLabel.textAlignment = .center
        item!.backgroundColor = UIColor.cyan
        item!.textLabel.layer.borderColor = UIColor.black.cgColor
        item!.textLabel.layer.borderWidth = 1
        return item!
    }
    
    func scrollMenu(_ menu: MinScrollMenu!, didSelectedItem item: MinScrollMenuItem!, at index: Int) {
        print("tap index: \(index)")
    }
    
    
}
