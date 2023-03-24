
import UIKit

class AnswersTableViewCell: UITableViewCell {
    //MARK: IBOutlet
    @IBOutlet weak var imageAnswer: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    /// identifier
    static let identifier = "AnswersTableViewCell"
    /// nib
    static func nib() -> UINib {
        return UINib(nibName: "AnswersTableViewCell", bundle: nil)
    }
    /// configure
    func configure(answer: Answer) {
        answerLabel?.text = answer.text
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
