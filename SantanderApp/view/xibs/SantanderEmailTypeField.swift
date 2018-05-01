// Custom Cell with value type: Bool
// The cell is defined using a .xib, so we can set outlets :)
import UIKit
import SwiftValidators

public class SantanderEmailTypeField: UIView{

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var placeholdertext: UITextField!
    
    @IBOutlet weak var lineStatus: UIImageView!
    
    public override func awakeFromNib() {
        self.placeholdertext.delegate = self
    }

}

extension SantanderEmailTypeField: UITextFieldDelegate{
    
    
    private func textFieldDidBeginEditing(textField: UITextField!) {    //delegate method
        
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        let validator = Validator.isEmail()
        if(validator.apply(textField.text)){
            self.lineStatus.image = UIImage(named: "line_green")
            return true
        }
        self.lineStatus.image = UIImage(named: "line_red")
        
        return false
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }
    
}


