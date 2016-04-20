//
//  DownSheet.swift
//  UINeedView
//
//  Created by 刘高晖 on 16/4/18.
//  Copyright © 2016年 刘高晖. All rights reserved.
//

import UIKit
@objc protocol DownSheetDelegate:NSObjectProtocol {
   optional func didSelectIndex(index:NSInteger)
}
class DownSheet: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var view:UITableView?
    var listData:NSArray?
    weak var delegate:DownSheetDelegate?

    init(list:NSArray,height:CGFloat){
       super.init(frame: CGRectZero)
       self.frame = UIScreen.mainScreen().bounds
        self.backgroundColor = UIColor.init(red: 160/255.0, green: 160/255.0, blue: 160/255.0, alpha: 0)
        view = UITableView.init(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height, CGRectGetWidth(self.frame), 44*CGFloat(list.count) + 40))
        view?.dataSource = self
        view?.delegate = self
        listData = list
        view!.scrollEnabled = false
        self.addSubview(view!)
        self.animaData()
    }
    func animaData(){
        
        UIView.animateWithDuration(0.25, animations: {
                      self.backgroundColor = UIColor.init(red: 160/255.0, green: 160/255.0, blue: 160/255.0, alpha: 0.4)
            UIView.animateWithDuration(0.25, animations: {
                self.view?.frame = CGRectMake(self.view!.frame.origin.x, UIScreen.mainScreen().bounds.height-self.view!.frame.size.height, self.view!.frame.size.width, self.view!.frame.size.height)
            })

            }, completion: nil)

    }
    func tappedCancel(){
        UIView.animateWithDuration(0.25, animations: { 
            self.view!.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height, UIScreen.mainScreen().bounds.width, 0)
            self.alpha = 0
            }) { (finished) in
                if finished{
                    self.removeFromSuperview()
                }
        }
    }
  
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.redColor()
        return view
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tappedCancel()
        if delegate != nil && delegate!.respondsToSelector("didSelectIndex:"){
            delegate!.didSelectIndex!(indexPath.row)
        }
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
