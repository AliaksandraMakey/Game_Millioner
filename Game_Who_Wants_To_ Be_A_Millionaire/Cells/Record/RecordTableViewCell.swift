
import UIKit

class RecordTableViewCell: UITableViewCell {
    //MARK: IBOutlet
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    /// identifier
    static let identifier = "RecordTableViewCell"
    /// nib
    static func nib() -> UINib {
        return UINib(nibName: "RecordTableViewCell", bundle: nil)
    }
    /// configure
    func configure(record: Record) {
            self.dateLabel?.text =  dateFormatter.string(from: record.date )
        self.recordLabel?.text =  "Отвечено \(String(describing: record.percentOfAllQuestions))%"
    }
    /// awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    /// setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
