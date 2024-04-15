

import Foundation

//MARK: Game
class Game {
    static let shared = Game()
    
    var gameSession: GameSession?
    
    var difficulty: Difficulty = .consistently
    
    var questionOrderStrategy: QuestionOrderStrategy {
        switch self.difficulty {
        case .consistently:
            return ConsistentlyQuestion()
        case .mixed:
            return MixedQuestion()
        }
    }
    
    private var recordsCaretaker = RecordsCaretaker()
    var result: [Int]? {
        return gameSession?.recordAnswer.value
    }
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(self.records)
        }
    }
    /// addRecord
    func addRecord(_ record: Record) {
        records.append(record)
    }
    /// clearRecords
    func clearRecords() {
        records = []
    }
    /// init
    init() {
        self.records = self.recordsCaretaker.retrieveRecords()
    }
}
