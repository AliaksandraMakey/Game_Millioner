
import Foundation

//MARK: Record
struct Record: Codable {
    var date: Date
    var score: Int
    var percentOfAllQuestions: Int {
        Int((100*self.score)/countAllQuestions)
    }
    var countAllQuestions: Int {
        gameQuestionsArray.count
    }
}
