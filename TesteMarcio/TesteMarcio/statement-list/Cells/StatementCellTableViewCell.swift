
import UIKit

class StatementCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func setStatement(statement: Statement){
        self.titleLabel.text = statement.title
        self.descLabel.text = statement.desc
        self.dateLabel.text = statement.date?.description
        self.valueLabel.text = statement.value?.description
    }
    
}

