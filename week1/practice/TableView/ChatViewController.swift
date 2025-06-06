import UIKit
import SnapKit
import Then

class ChatViewController: UIViewController {
    
    private let chatList = ChatModel.dummy()
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayOut()
        setStyle()
    }
    
    private func setLayOut() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setStyle() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(ChatTableViewCell.self, forCellReuseIdentifier: "ChatTableViewCell")
        }
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath)
                as? ChatTableViewCell else {
            return UITableViewCell()
        }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
