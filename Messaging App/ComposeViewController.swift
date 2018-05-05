//
//  ComposeViewController.swift
//  Messaging App
//
//  Created by Tushar Singh on 05/05/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
ref =  Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPost(_ sender: Any) {
        ref?.child("Posts").childByAutoId().setValue(textView.text)
        //adding to firebase
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancelPost(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    


}
