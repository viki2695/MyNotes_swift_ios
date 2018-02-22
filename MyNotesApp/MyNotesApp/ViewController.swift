//
//  ViewController.swift
//  MyNotesApp
//
//  Created by vigneswaran on 22/02/18.
//  Copyright © 2018 vigneswaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var txtDes: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buSave(_ sender: Any) {
        
        let newNote = MyNotes(context: context)
        newNote.title = txtTitle.text!
        newNote.details = txtDes.text!
        
        newNote.save_date = NSDate() as Date
        
        do{
            ad.saveContext()
            txtTitle.text = ""
            txtDes.text = ""
        }catch{
            print("Cannot save")
        }
    }
}

