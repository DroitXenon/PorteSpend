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
class Comments2View: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var buttonTab1: UIButton!
	@IBOutlet var buttonTab2: UIButton!

	@IBOutlet var viewTab1: UIView!
	@IBOutlet var viewTab2: UIView!

	private var comments: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "87 comments"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		tableView.register(UINib(nibName: "Comments2Cell", bundle: Bundle.main), forCellReuseIdentifier: "Comments2Cell")
		tableView.tableFooterView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 80, height: 80)))

		updateUI()
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		buttonTab1.isSelected = true

		comments.removeAll()

		var dict1: [String: String] = [:]
		dict1["username"] = "Amy Roberts"
		dict1["description"] = "Of all of the celestial bodies that capture our attention and fascination as astronomers, none has a greater influence on life on planet Earth than it’s own satellite, the moon."
		dict1["date"] = "14 Mar 2020"
		dict1["like"] = "77.1k"
		dict1["replay"] = ""
		comments.append(dict1)

		var dict2: [String: String] = [:]
		dict2["username"] = "Betty Hansen"
		dict2["description"] = "In the history of modern astronomy, there is probably no one greater leap forward"
		dict2["date"] = "19 Mar 2020"
		dict2["like"] = "91.3k"
		dict2["replay"] = ""
		comments.append(dict2)

		var dict3: [String: String] = [:]
		dict3["username"] = "Chloe Adams"
		dict3["description"] = "There is a lot of exciting stuff going on"
		dict3["date"] = "21 Mar 2020"
		dict3["like"] = "65.2k"
		dict3["replay"] = "38"
		comments.append(dict3)

		var dict4: [String: String] = [:]
		dict4["username"] = "Doris Royston"
		dict4["description"] = "Already study this site on awards its amazing works."
		dict4["date"] = "12 Mar 2020"
		dict4["like"] = "956"
		dict4["replay"] = ""
		comments.append(dict4)

		var dict5: [String: String] = [:]
		dict5["username"] = "Emma Harris"
		dict5["description"] = "I thought you guys had made a VR experience for the website too "
		dict5["date"] = "09 Mar 2020"
		dict5["like"] = "854"
		dict5["replay"] = ""
		comments.append(dict5)

		var dict6: [String: String] = [:]
		dict6["username"] = "Fabia Smith"
		dict6["description"] = "Wao is amazing!"
		dict6["date"] = "10 Mar 2020"
		dict6["like"] = "78.2k"
		dict6["replay"] = ""
		comments.append(dict6)

		var dict7: [String: String] = [:]
		dict7["username"] = "Alan Nickerson"
		dict7["description"] = "Congrat! Best of luck. Already study this site on awards its amazing works."
		dict7["date"] = "06 Mar 2020"
		dict7["like"] = "78.2k"
		dict7["replay"] = ""
		comments.append(dict7)

		var dict8: [String: String] = [:]
		dict8["username"] = "Brian Elwood"
		dict8["description"] = "For a second there, I thought you guys had made a VR experience for the website too "
		dict8["date"] = "12 Mar 2020"
		dict8["like"] = "78.2k"
		dict8["replay"] = ""
		comments.append(dict8)

		var dict9: [String: String] = [:]
		dict9["username"] = "Chris Michael"
		dict9["description"] = "Excellent work :)"
		dict9["date"] = "18 Mar 2020"
		dict9["like"] = "78.2k"
		dict9["replay"] = ""
		comments.append(dict9)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
		DispatchQueue.main.async {
			UIView.setAnimationsEnabled(false)
			self.tableView.beginUpdates()
			self.tableView.endUpdates()
			UIView.setAnimationsEnabled(true)
		}
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		buttonTab1.titleLabel?.textColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.label
		buttonTab2.titleLabel?.textColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.label

		viewTab1.backgroundColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
		viewTab2.backgroundColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab1(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = true
		buttonTab2.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab2(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = true
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddComment(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = true
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFavorite(_ sender: UIButton) {

		print(#function)
	}
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionViewReplies(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Comments2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return comments.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Comments2Cell", for: indexPath) as! Comments2Cell
		cell.bindData(index: indexPath.item, data: comments[indexPath.row])
		cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
		cell.buttonViewReplies.addTarget(self, action: #selector(actionViewReplies(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Comments2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

		return true
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

		let messageAction = UIContextualAction(style: .normal, title: nil) { (action, view, completionHandler) in
			print(indexPath)
			print(#function)
			completionHandler(true)
		}
		messageAction.image = UIImage(systemName: "text.bubble.fill")
		messageAction.backgroundColor = AppColor.Theme

		let reportAction = UIContextualAction(style: .normal, title: nil) { (action, view, completionHandler) in
			print(indexPath)
			print(#function)
			completionHandler(true)
		}
		reportAction.image = UIImage(systemName: "exclamationmark.circle.fill")
		reportAction.backgroundColor = UIColor.systemGray

		return UISwipeActionsConfiguration(actions: [reportAction, messageAction])
	}
}
