//
//  TableViewCell.swift
//  ContactsApp
//
//  Created by Julien on 25/08/21.
//

import UIKit

protocol ContactDelegate {
    func contactingForEditing(at Index:IndexPath)
    func contactingForDeleting(at index:IndexPath)
    
}
class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phoneno: UILabel!
    var delegate:ContactDelegate?
    
    var indexpath:IndexPath!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func didTapEditButton(_ sender: UIButton) {
        delegate?.contactingForEditing(at: indexpath)
    }
    
    @IBAction func didTapDeleteButton(_ sender: Any) {
        delegate?.contactingForDeleting(at: indexpath)
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
