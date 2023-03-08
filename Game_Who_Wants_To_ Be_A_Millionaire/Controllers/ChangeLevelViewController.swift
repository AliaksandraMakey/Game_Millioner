
import UIKit

//MARK: ChangeLevelViewController
class ChangeLevelViewController: UIViewController {
    /// selectedDifficulty
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .consistently
        case 1:
            return .mixed
        default:
            return .consistently
        }
    }
    //MARK: IBOutlet
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /// prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "FromChangeToStartVC":
            guard segue.destination is StartGameViewController else { return }
            Game.shared.difficulty = self.selectedDifficulty
        default:
            break
        }
    }
}



