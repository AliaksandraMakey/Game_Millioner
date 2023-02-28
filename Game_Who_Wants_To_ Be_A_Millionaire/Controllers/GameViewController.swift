

import UIKit


class QuestionsViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTableView: UITableView!
    
    var newGame = GameSession()
    var gameModel = [Question]()
    var currentQuestions: Question?
    /// delegate
    weak var delegate: EndGameDelegate?
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        answerTableView.delegate = self
        answerTableView.dataSource = self
        newGame.gameDelegate = self
        answerTableView.backgroundColor = .clear
        answerTableView.register(AnswersTableViewCell.nib(), forCellReuseIdentifier: AnswersTableViewCell.identifier)
        configureUI(question: gameModel.first!)
    }
    /// checAnswer
    private func checkAnswer(answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: { $0.text == answer.text }) && answer.correct
    }
    /// setupQuestions
    func setupQuestions() {
        gameModel = gameQuestions
    }
    /// configureUI
    private func configureUI(question: Question) {
        questionLabel.text = question.text
        currentQuestions = question
        answerTableView.reloadData()
    }
}
//MARK: extension QuestionsViewController
extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource {
    // TODO: Дополнительно: можете добавить в игру возможность использовать подсказку — «Звонок другу», «Помощь зала», «Убрать два неправильных ответа».
    /// didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuestions else {return}
        let answer = question.answers[indexPath.row]
        if checkAnswer(answer: answer, question: question) {
            if let index = gameModel.firstIndex(where: {$0.text == question.text}) {
                if index < (gameModel.count - 1) {
                    let nextQuestion = gameModel[index+1]
                    
                    // добавляем в массив результатов
                    newGame.recordAnswer.append(index)
                    currentQuestions = nil
                    configureUI(question: nextQuestion)
                } else {
                    let alert = UIAlertController(title: "Congratulations!", message: "Game’s over, you’re good!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                    present(alert, animated: true)
                }
            }
        } else {
            let recordAnswer = newGame.recordAnswer
            newGame.gameDelegate?.didEndGame(result: (recordAnswer.count))
             Game.shared.addRecord((Record(date: Date(), score: recordAnswer.count)))
           
        }
    }
    /// numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestions?.answers.count ?? 0
    }
    /// cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnswersTableViewCell.identifier, for: indexPath) as? AnswersTableViewCell,
              let answer = (currentQuestions?.answers[indexPath.row]) else { return UITableViewCell() }
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
extension QuestionsViewController: EndGameDelegate {
    func didEndGame(result: Int) {
        delegate?.didEndGame(result: result)
        self.dismiss(animated: true, completion: nil)
    }
}
