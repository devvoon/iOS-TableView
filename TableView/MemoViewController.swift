//
//  MemoViewController.swift
//  TableView
//
//  Created by DAMA on 2017. 9. 11..
//  Copyright © 2017년 iamdawoonjeong. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    // MARK : - Variable
    @IBOutlet weak var DetailMemoView: UITextView!
    
    var Data = [String]()
    var Order = Int()
    
    // Variable_End
    
    
    // MARK: - Status Bar
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Status Bar_End
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Data = UserDefaults.standard.object(forKey: "Data") as? [String] ?? [String]()
        
        Order =  UserDefaults.standard.object(forKey: "Order") as! Int
        
        if Order >= 0 {
            DetailMemoView.text = Data[Order]
            
        }else {
            DetailMemoView.text = "input anything.."
        }
        
    }
    
    // MARK : - Action
    
    @IBAction func SaveMemo(_ sender: Any) {
        
        Order =  UserDefaults.standard.object(forKey: "Order") as! Int

        if Order >= 0 {
            
            Data.remove(at: Order)
            Data.insert(DetailMemoView.text, at: 0)
            UserDefaults.standard.set(Data, forKey: "Data")
            
        }else{
            Data.insert(DetailMemoView.text, at: 0)
            UserDefaults.standard.set(Data, forKey: "Data")
        }
        
    }
    
    // Action_End
}
