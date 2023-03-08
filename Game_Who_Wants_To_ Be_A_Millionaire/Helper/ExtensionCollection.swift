
import UIKit

//MARK: Collection Extension
extension Collection {
    func shuffled() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffle()
        return list
    }
}
