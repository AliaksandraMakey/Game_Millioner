

import Foundation
//MARK: EndGameDelegate Protocol
protocol EndGameDelegate: AnyObject {
    func didEndGame(result: Int)
}
//MARK: GameSession
class GameSession {
    weak var gameDelegate: EndGameDelegate?
    var addedQuestionsCaretaker = AddedQuestionsCaretaker()
    var currentQuestion: Question?
    var questions: [Question]
    var record: Record?
    var recordAnswer = Observable<[Int]>([Int]())
    /// init
    init(questions: [Question]) {
        self.questions = gameQuestionsArray + addedQuestionsCaretaker.retrieveQuestions()
    }
}
