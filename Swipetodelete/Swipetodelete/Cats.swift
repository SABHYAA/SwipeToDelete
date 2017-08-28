//
//  Cats.swift
//  Swipetodelete
//
//  Created by appinventiv on 24/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Cats: UIViewController {

    @IBOutlet var tableview: UITableView!
    var catsName = ["snoop", "sniffy", "rosy", "sammy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableview.dataSource = self
        self.tableview.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Cats : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return catsName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Catcell", for: indexPath) as? Catcell else { fatalError("") }
        
        cell.catNameLabel.text = catsName[indexPath.row]
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.catsName.remove(at: indexPath.row)
            self.tableview.reloadData()
            
        }
}
    
}

class Catcell: UITableViewCell {
    
    @IBOutlet var catNameLabel: UILabel!
    
}
