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
    
    var testWishes = [" puppy", "PS4", "Laptop"]

    override func viewDidLoad () {
        super.viewDidLoad()
        
        myWishlist.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        if wishes.count == 0{
            addGift()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.wishes[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("yo")
    }
    
    func addGift(){
        let alertController = UIAlertController(title: "gift", message: "What gift do you want?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields?[0] {
                // store your data
                self.wishes.append(field.text!)
                self.myWishlist.reloadData()
            } else {
                // user did not fill field
                print("User did not fill")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter what gift you'd like!"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)


    }
    

    @IBAction func addButtonTapped(_ sender: Any) {
        addGift()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            wishes.remove(at: indexPath.row)
            myWishlist.reloadData()
            if wishes.count == 0{
                addGift()
            }
        }
        
        
    }
    
    

}

