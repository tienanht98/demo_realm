//
//  ToDoListTableViewCell.swift
//  demo_realm
//
//  Created by Tran Tien Anh on 3/22/20.
//  Copyright © 2020 Tran_Tien_Anh. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {

    @IBOutlet weak var tfContent: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        tfContent.delegate = self
        // Initialization code
    }
 var completion: ((String?) -> Void)!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ToDoListTableViewCell : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.completion(textField.text)
    }

}
