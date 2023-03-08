
import UIKit

//MARK: Consistently Question
final class ConsistentlyQuestion: QuestionOrderStrategy {
    /// getQuestions
    func getQuestions() -> [Question] {
        return gameQuestionsArray
    }
}
