
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
    func configure(record: [Record]) {
        for test in record {
            self.dateLabel?.text =  dateFormatter.string(from: test.date )
            self.recordLabel?.text =  "Отвечено верно \(String(describing: test.score))"
        }
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
