//
// Copyright (c) 2021 Related Code - https://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class ChatsView: UIViewController {

	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var tableView: UITableView!

	private var chats: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Chats"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(actionEdit(_:)))
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(actionAdd(_:)))

		tableView.register(UINib(nibName: "ChatsCell", bundle: Bundle.main), forCellReuseIdentifier: "ChatsCell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		chats.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Alan Nickerson"
		dict1["isPrivate"] = "0"
		dict1["username"] = ""
		dict1["message"] = "Be who you are and say what you feel, because those who…"
		dict1["time"] = "19:03"
		dict1["count"] = "1"
		dict1["tick"] = "0"
		chats.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "App Design Kit"
		dict2["isPrivate"] = "0"
		dict2["username"] = "Dave Smith"
		dict2["message"] = "So many books, so little time."
		dict2["time"] = "19:03"
		dict2["count"] = "76"
		dict2["tick"] = "1"
		chats.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Fernando Harris"
		dict3["isPrivate"] = "1"
		dict3["username"] = ""
		dict3["message"] = "And, when you want something, all the universe conspires in helpi…"
		dict3["time"] = "19:03"
		dict3["count"] = ""
		dict3["tick"] = "0"
		chats.append(dict3)

		chats.append(dict1)
		chats.append(dict2)
		chats.append(dict3)
		chats.append(dict1)
		chats.append(dict2)
		chats.append(dict3)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionEdit(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ChatsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return chats.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ChatsCell", for: indexPath) as! ChatsCell
		cell.bindData(index: indexPath.item, data: chats[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ChatsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 90
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

		let muteAction = UIContextualAction(style: .normal, title: nil) { (action, view, completionHandler) in
			print(#function)
			completionHandler(true)
		}
		muteAction.image = UIImage(systemName: "speaker.slash.fill")
		muteAction.backgroundColor = UIColor.darkGray

		let deleteAction = UIContextualAction(style: .normal, title: nil) { (action, view, completionHandler) in
			print(#function)
			completionHandler(true)
		}
		deleteAction.image = UIImage(systemName: "trash.fill")
		deleteAction.backgroundColor = UIColor.systemGray

		return UISwipeActionsConfiguration(actions: [deleteAction, muteAction])
	}
}
