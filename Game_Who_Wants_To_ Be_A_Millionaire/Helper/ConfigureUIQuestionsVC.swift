
import UIKit

/// configureUI
func configureUIQuestionsVC(session: GameSession,
                            question: Question,
                            label: UILabel,
                            tableView: UITableView) {
    label.text = question.text
    session.currentQuestion = question
    tableView.reloadData()
}
