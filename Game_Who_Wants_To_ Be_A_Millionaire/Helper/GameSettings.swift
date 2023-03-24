
import UIKit

// TODO: Дополнительно: можете добавить в игру возможность использовать подсказку — «Звонок другу», «Помощь зала», «Убрать два неправильных ответа».


/// gameSettings
func gameSettings(session: GameSession,
                  questions: [Question],
                  question: Question,
                  indexPath: IndexPath,
                  tableView: UITableView,
                  label: UILabel) {
    
    if let index = questions.firstIndex(where: {$0.text == question.text}) {
        if index < (questions.count - 1) {
            let nextQuestion = session.questions[index+1]
            session.recordAnswer.value.append(index)
            session.currentQuestion = nil
            configureUIQuestionsVC(session: session,
                                   question: nextQuestion,
                                   label: label,
                                   tableView: tableView)
        } else {
            // TODO: добавить переход на экран анимации с поздравлениями 
        }
    }
}
