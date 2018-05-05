//
//  ViewController.swift
//  Messaging App
//
//  Created by Tushar Singh on 05/05/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ref:DatabaseReference?
    var postData = [String]()
    var databaseHandle : DatabaseHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   tableView.delegate=self
   tableView.dataSource=self
   
       //firebase reference
    ref = Database.database().reference()
        
        //retrieve posts
       databaseHandle = ref?.child("Posts").observe( .childAdded, with: { (snapshot) in
        let post = snapshot.value as? String
        if let actualPost = post {
        self.postData.append(actualPost)
            
             self.tableView.reloadData()
        
        }})
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData [indexPath.row]
         return cell! 
    }
    
    
    @IBOutlet weak var tableView: UITableView!
}

