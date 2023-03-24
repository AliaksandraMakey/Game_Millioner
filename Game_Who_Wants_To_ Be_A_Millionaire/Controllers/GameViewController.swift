

import UIKit

//MARK: QuestionsViewController
class GameViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTableView: UITableView!
    @IBOutlet weak var intermediateResultLabel: UILabel!
    @IBOutlet weak var percentOfAllQuestions: UILabel!
    var gameSession = GameSession(questions: Game.shared.questionOrderStrategy.getQuestions())
    /// delegate
    weak var delegate: EndGameDelegate?
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        answerTableView.delegate = self
        answerTableView.dataSource = self
        gameSession.gameDelegate = self
        answerTableView.backgroundColor = .clear
        answerTableView.register(AnswersTableViewCell.nib(),
                                 forCellReuseIdentifier: AnswersTableViewCell.identifier)
        
        configureUIQuestionsVC(session: gameSession,
                               question: gameSession.questions.first!,
                               label: questionLabel,
                               tableView: answerTableView)
        gameSession.recordAnswer.addObserver(self, options: [.new, .initial]) { [weak self] (current, _) in
            self?.intermediateResultLabel.text = "Текущий вопрос: \(current.count + 1) "
        }
        
//        gameSession.record?.percentOfAllQuestions.addObserver(self, options: [.new, .initial]) { [weak self] (percent, _) in
//            self?.percentOfAllQuestions.text = "Отвечено: \(percent)%"
//        }
    }
}
//MARK: extension QuestionsViewController
extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    /// didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        /// Game configurations
        guard let question = gameSession.currentQuestion else {return}
        let answer = question.answers[indexPath.row]
        if Answer.checkAnswer(answer: answer, question: question) {
            gameSettings(session: gameSession,
                         questions: gameSession.questions,
                         question: question,
                         indexPath: indexPath,
                         tableView: answerTableView,
                         label: questionLabel)
        } else {
            let recordAnswer = gameSession.recordAnswer
            gameSession.gameDelegate?.didEndGame(result: (recordAnswer.value.count))
            Game.shared.addRecord((Record(date: Date(), score: recordAnswer.value.count)))
        }
    }
    /// numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameSession.currentQuestion?.answers.count ?? 0
    }
    /// cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnswersTableViewCell.identifier, for: indexPath) as? AnswersTableViewCell,
              let answer = (gameSession.currentQuestion?.answers[indexPath.row])  else { return UITableViewCell() }
        cell.configure(answer: answer)
        return cell
    }
    /// prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FromGameStartGame"{
            let vc = segue.destination as? StartGameViewController
            self.presentedViewController?.present(vc!, animated: true)
        }
    }
}
//MARK: extension End Game Delegate for QuestionsVC
extension GameViewController: EndGameDelegate {
    func didEndGame(result: Int) {
        delegate?.didEndGame(result: result)
        self.dismiss(animated: true, completion: nil)
    }
}
