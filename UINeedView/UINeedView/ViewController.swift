//
//  ViewController.swift
//  UINeedView
//
//  Created by 刘高晖 on 16/4/18.
//  Copyright © 2016年 刘高晖. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DownSheetDelegate {
  var array = []
    
    @IBAction func ProduceView(sender: AnyObject) {
        let sheet = DownSheet.init(list: array, height: 0)
        sheet.delegate = self
        self.view.addSubview(sheet)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        array = [1,2,3,4,5,6]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didSelectIndex(index: NSInteger) {
        print(index)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

