//
//  ViewController.swift
//  MAPD124-Test
//
//  Created by Guilherme Morais on 2017-02-21.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//  Student #300878610

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var shoppingTableView: UITableView!
    @IBOutlet weak var listTitle: UITextField!
    
    @IBAction func Add(_ sender: UIBarButtonItem) {
        Data.append(Item(item: "Product " + String(Data.count+1), qty: 0))
        
        DispatchQueue.main.async {
            self.shoppingTableView.reloadData()
        }

    }

    
    var Data = [Item]()
    func loadData() -> Void
    {
        Data.append(Item(item: "Product 1", qty: 0))
        Data.append(Item(item: "Product 2", qty: 0))
        Data.append(Item(item: "Product 3", qty: 0))
        Data.append(Item(item: "Product 4", qty: 0))
        Data.append(Item(item: "Product 5", qty: 0))
    }
    
    override func viewDidLoad() {
        loadData()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.shoppingTableView.reloadData()
        }
    }
    
    @IBAction func cancelClick(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "main") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
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
        cell.textItem.text = Data[indexPath.row].item

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            Data.remove(at: indexPath.row)
            viewDidAppear(true)
        }
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

