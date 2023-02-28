

import Foundation

protocol EndGameDelegate: AnyObject {
    func didEndGame(result: Int)
}

class GameSession {
    
    weak var gameDelegate: EndGameDelegate?
    
    var record: Record?
    var recordAnswer = [Int]()
    
    // TODO: посчитайте результат — какой процент от общего числа вопросов получили правильные ответы
    var countAllQuestions: Int {
        gameQuestions.count
    }
}
