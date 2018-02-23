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
    var editNotes:MyNotes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let note = editNotes {
            txtTitle.text = note.title
            txtDes.text = note.details
        }
    }

    @IBAction func buSave(_ sender: Any) {
        
        var newNote:MyNotes?
        
        if let note = editNotes{
            newNote = note
        }else{
            newNote = MyNotes(context: context)
        }
        newNote?.title = txtTitle.text!
        newNote?.details = txtDes.text!
        newNote?.save_date = NSDate() as Date
        
        do{
            ad.saveContext()
            txtTitle.text = ""
            txtDes.text = ""
        }catch{
            print("Cannot save")
        }
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

