

import UIKit

//TODO: Дополнительно: можете добавить в структуру поля, отображающие, что будет, если взять подсказку «Звонок другу» или «Помощь зала».

//MARK: Question
class Question: Codable {
    let text: String
    let answers: [Answer]
    init(text: String, answers: [Answer]) {
        self.text = text
        self.answers = answers
    }

}
//MARK: Answer
class Answer: Codable {
    let text: String
    let correct: Bool
    init(text: String, correct: Bool) {
        self.text = text
        self.correct = correct
    }
    /// checkAnswer
    public static func checkAnswer(answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: { $0.text == answer.text }) && answer.correct
    }
}


