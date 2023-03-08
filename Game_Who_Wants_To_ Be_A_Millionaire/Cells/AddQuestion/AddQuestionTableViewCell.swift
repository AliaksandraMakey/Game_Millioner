

import UIKit


class AddQuestionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var rigthAnswer: UITextField!
    @IBOutlet weak var wrongAnswerOne: UITextField!
    @IBOutlet weak var wrongAnswerTwo: UITextField!
    @IBOutlet weak var wrongAnswerThree: UITextField!
    
    
    var parentVC: UIViewController!
    
    static let identifier = "AddQuestionTableViewCell"
    /// nib
    static func nib() -> UINib {
        return UINib(nibName: "AddQuestionTableViewCell", bundle: nil)
    }
    /// configure
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private var addedQuestionsCaretaker = AddedQuestionsCaretaker()
    @IBAction func addQuestion(_ sender: UIButton) {
        // FIXME: .text == nil or .state.isEmpty
        if (questionText.state.isEmpty) || (rigthAnswer.text == nil) || (wrongAnswerOne.text == nil) || (wrongAnswerTwo.text == nil) || (wrongAnswerThree.text == nil) {
            let alert = UIAlertController(title: "OOPS!", message: "Заполните все поля.",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Попробовать еще раз?",
                                          style: UIAlertAction.Style.default, handler: nil))
            parentVC.present(alert, animated: true, completion: nil)
        } else {
            // TODO: add function perform segue to StartGameVC
            let answersArray = [Answer(text: rigthAnswer.text!, correct: true),
                                Answer(text: wrongAnswerTwo.text!, correct: false),
                                Answer(text: wrongAnswerOne.text!, correct: false),
                                Answer(text: wrongAnswerThree.text!, correct: false)].shuffled()
            
            //            let question: [Question] = [Question(text: questionText.text!,
            //                                                 answers: answersArray)]
            //                    addedQuestionsCaretaker.save(question)
            
            // ВСЕГДА ПОКАЗЫВАЕТ ТОЛЬКО 1 ДОЮАВЛЕННЫЙ ВОПРОС
            var question: [Question] = [Question(text: questionText.text!,
                                                 answers: answersArray)]
            {
                didSet {
                    addedQuestionsCaretaker.save(question)
                }
            }
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
