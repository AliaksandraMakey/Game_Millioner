

import UIKit

class StartGameViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var buttonImageOne: UIImageView!
    @IBOutlet weak var buttonImageTwo: UIImageView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var resultsGameButton: UIButton!
    @IBOutlet weak var quickResultLabel: UILabel!
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        loadImageAnimation(image: backgroundImage, buttonOne: buttonImageOne, buttonTwo: buttonImageTwo)
    }
    //MARK: IBAction
    @IBAction func startGameButton(_ sender: Any) {}
    @IBAction func resultsButton(_ sender: Any) {}
    /// prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "FromStartVCToQuestionsVC":
            guard let vc = segue.destination as? QuestionsViewController else {return}
            vc.delegate = self
        default:
            break
        }
    }
} 
//MARK: extension End Game Delegate for StartGameVC
extension StartGameViewController: EndGameDelegate {
    func didEndGame(result: Int) {
        quickResultLabel.text = "Отвечено на \(result) вопрос(а)"
    }
}
