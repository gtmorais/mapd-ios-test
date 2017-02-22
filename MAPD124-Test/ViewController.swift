//
//  ViewController.swift
//  MAPD124-Test
//
//  Created by Guilherme Morais on 2017-02-21.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var Data:[Item] = []
    func loadData() -> Void
    {
        Data.append(Item(item: "Item 1", qty: 0))
    }
    
    override func viewDidLoad() {
        loadData()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rows", for: indexPath) as! CustomTableViewCell
        
        cell.itemText.text = Data[indexPath.row].item
        return cell
    }
    
    

}

class Item{
    var item:String
    var qty:Int
    
    init(item: String, qty: Int) {
        self.item = item
        self.qty = qty
    }
}

