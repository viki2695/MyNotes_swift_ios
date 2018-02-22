//
//  VCListNotes.swift
//  MyNotesApp
//
//  Created by vigneswaran on 22/02/18.
//  Copyright © 2018 vigneswaran. All rights reserved.
//

import UIKit
import CoreData

class VCListNotes: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listNotes = [MyNotes]()
    @IBOutlet weak var tvNotesList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes()
        
        tvNotesList.delegate = self
        tvNotesList.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCListNotes = tableView.dequeueReusableCell(withIdentifier: "CellNotes", for:indexPath) as! TVCListNotes
        cell.setNotes(notes: listNotes[indexPath.row])
        cell.buDelete.tag = indexPath.row
        cell.buDelete.addTarget(self, action: #selector(buDeletePress(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func buDeletePress(_ sender: UIButton){
        print("index \(sender.tag)")
        
        context.delete(listNotes[sender.tag])
        loadNotes()
    }
    
    func loadNotes(){
        let fetchRequest:NSFetchRequest<MyNotes> = MyNotes.fetchRequest()
        
        do{
            listNotes = try context.fetch(fetchRequest)
            tvNotesList.reloadData()
        }catch{
            print("Cannot read from database")
        }
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
