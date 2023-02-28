

import Foundation

//MARK: Game
class Game {
    static let shared = Game()
    var gameSession: GameSession?
    private var recordsCaretaker = RecordsCaretaker()
    var result: [Int]? {
        return gameSession?.recordAnswer
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

