//
//  ViewController.swift
//  SpyBuy
//
//  Created by ryala on 2/22/17.
//  Copyright © 2017 Barrington Highschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var myWishlist: UITableView!
    
    var wishes = [String]()
    
    var testWishes = ["puppy", "PS4", "Laptop"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWishlist.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testWishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.testWishes[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("fuck you")
    }


}

