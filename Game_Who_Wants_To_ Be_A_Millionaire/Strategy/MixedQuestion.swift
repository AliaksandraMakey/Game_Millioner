
import Foundation

//MARK: Mixed Question
final class MixedQuestion: QuestionOrderStrategy {
    /// getQuestions
    func getQuestions() -> [Question] {
        return gameQuestionsArray.shuffled()
    }
}
