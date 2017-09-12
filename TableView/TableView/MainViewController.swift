//
//  MainViewController.swift
//  TableView
//
//  Created by DAMA on 2017. 9. 7..
//  Copyright © 2017년 iamdawoonjeong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    
    // MARK: - Variable
    var Data = [String]()
    // Variable_End

    
    // MARK: - Status Bar
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Status Bar_End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Data = UserDefaults.standard.object(forKey: "Data") as? [String] ?? [String]()
        
    }
    
    // MARK: - Table View
    
    //row의 갯수를 데이터 갯수에 맞게 뿌려주기
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    //각 셀에 데이터 순서대로 넣어주기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCellView
        Cell.TitleLabel.text = Data[indexPath.row]
        return Cell
    }
    
    // 셀 편집시
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            Data.remove(at: indexPath.row)
            UserDefaults.standard.set(Data, forKey: "Data")
            
            tableView.deleteRows(at: [indexPath], with: .fade)

            
        }else if editingStyle == .insert {
            //insert
        }
    }
    
    //셀 선택후 행동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //print ("didSelectRowAt : \(indexPath.row)")
        
        UserDefaults.standard.set(indexPath.row, forKey: "Order")
        performSegue(withIdentifier: "ToMemo", sender: self)
    }

    // Table View_End
    
    
    // MARK: - Action
    
    @IBAction func AddMemo(_ sender: Any) {
        UserDefaults.standard.set(-1, forKey: "Order")
    }
    
    // Action_End
    
}
