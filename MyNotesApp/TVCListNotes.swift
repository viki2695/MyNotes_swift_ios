//
//  TVCListNotes.swift
//  MyNotesApp
//
//  Created by vigneswaran on 22/02/18.
//  Copyright © 2018 vigneswaran. All rights reserved.
//

import UIKit

class TVCListNotes: UITableViewCell {

    @IBOutlet weak var laDate: UILabel!
    @IBOutlet weak var laDetails: UITextView!
    @IBOutlet weak var laTitle: UILabel!
    @IBOutlet weak var buDelete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setNotes(notes: MyNotes){
        laTitle.text = notes.title!
        laDetails.text = notes.details!
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yy h:mm a"
        let now = dateFormat.string(from: notes.save_date as! Date)
        
        laDate.text = now
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
