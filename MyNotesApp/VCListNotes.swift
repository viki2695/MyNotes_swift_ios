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
        
        cell.buEdit.tag = indexPath.row
        cell.buEdit.addTarget(self, action: #selector(buEditPress(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func buEditPress(_ sender: UIButton){
        print("index \(sender.tag)")
        performSegue(withIdentifier: "EditorAddSegue", sender: listNotes[sender.tag])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditorAddSegue" {
            if let AddorEdit = segue.destination as? ViewController{
                if let mynote = sender as? MyNotes{
                    AddorEdit.editNotes = mynote
                }
            }
        }
    }
    
    @IBAction func buAdd(_ sender: Any) {
        performSegue(withIdentifier: "EditorAddSegue", sender: nil)
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
    
}
