
import UIKit

//MARK: Caretaker
final class AddedQuestionsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "addedQuestions"
    /// save
    func save(_ question: [Question]) {
        do {
            let data = try encoder.encode(question)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error) }
    }
    /// retrieveRecords
    func retrieveQuestions() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
