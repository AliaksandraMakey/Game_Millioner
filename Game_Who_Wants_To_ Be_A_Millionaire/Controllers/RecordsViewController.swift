

import UIKit

class ResultsViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet weak var resultTableView: UITableView!
    /// singlton
    var records = Game.shared.records
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.dataSource = self
        resultTableView.backgroundColor = .clear
        resultTableView.register(RecordTableViewCell.nib(), forCellReuseIdentifier: RecordTableViewCell.identifier)
    }
}
//MARK: extension ResultsViewController
extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {
    /// numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    /// cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecordTableViewCell.identifier, for: indexPath) as? RecordTableViewCell else { return UITableViewCell() }
        let records = Game.shared.records
        cell.configure(record: records)
        return cell
    }
}
