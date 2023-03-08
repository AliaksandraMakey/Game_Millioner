

import UIKit
// AddQuestionCell
class AddQuestionViewController: UIViewController {
    
    @IBOutlet weak var addQuestionTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionTableView.delegate = self
        addQuestionTableView.dataSource = self
        addQuestionTableView.register(AddQuestionTableViewCell.nib(),
                                 forCellReuseIdentifier: AddQuestionTableViewCell.identifier)
    }
    
}

extension AddQuestionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddQuestionTableViewCell") as! AddQuestionTableViewCell
        cell.parentVC = self
        return cell
    }
    
    
}
