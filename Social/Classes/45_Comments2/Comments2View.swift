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
import IQKeyboardManagerSwift

//-----------------------------------------------------------------------------------------------------------------------------------------------
class Comments2View: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var textFieldComment: UITextField!
	@IBOutlet var layoutConstraintBottom: NSLayoutConstraint!

	private var comments: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "5 comments"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMenu(_:)))

		tableView.register(UINib(nibName: "Comments2Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Comments2Cell1")

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
		IQKeyboardManager.shared.enable = false

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillLayoutSubviews() {

		super.viewWillLayoutSubviews()
		refreshTableView()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
		NotificationCenter.default.removeObserver(self)
		IQKeyboardManager.shared.enable = true
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldComment.attributedPlaceholder = NSAttributedString(string: "Write a comment…", attributes: attribute)

		comments.removeAll()

		var dict1: [String: Any] = [:]
		dict1["name"] = "Amy Roberts"
		dict1["comment"] = "Gorgeous!"
		dict1["likes"] = "0 likes"
		dict1["time"] = "2 hours"
		dict1["replies"] = "34 replies"
		comments.append(dict1)

		var dict2: [String: Any] = [:]
		dict2["name"] = "Doris Royston"
		dict2["comment"] = "In the history of modern astronomy, there is probably no one greater leap forward"
		dict2["likes"] = "2 likes"
		dict2["time"] = "13 min"
		dict2["replies"] = "2 replies"
		dict2["otherComments"] = dict1
		comments.append(dict2)

		var dict3: [String: Any] = [:]
		dict3["name"] = "Alan Nickerson"
		dict3["comment"] = "Of all of the celestial bodies that capture our attention and fascination as astronomers, none has a greater influence on life on planet Earth than it’s own satellite, the moon."
		dict3["likes"] = "71 likes"
		dict3["time"] = "Yesterday at 09:31"
		dict3["replies"] = "34 replies"
		comments.append(dict3)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		DispatchQueue.main.async {
			self.tableView.reloadData()
			self.tableView.layoutIfNeeded()

			UIView.setAnimationsEnabled(false)
			self.tableView.beginUpdates()
			self.tableView.endUpdates()
			UIView.setAnimationsEnabled(true)
		}
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func keyboardWillShow(_ notification: Notification) {

		if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
			let keyboardRectangle = keyboardFrame.cgRectValue
			let keyboardHeight = keyboardRectangle.height
			print(keyboardHeight)
			UIView.animate(withDuration: 0.5) {
				self.layoutConstraintBottom.constant = keyboardHeight
				print(self.layoutConstraintBottom.constant)
			}
			UIView.animate(withDuration: 0.5, animations: {
				self.layoutConstraintBottom.constant = keyboardHeight
			}) { (isComplete) in
				self.layoutConstraintBottom.constant -= self.view.safeAreaInsets.bottom
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func keyboardWillHide(_ notification: Notification) {

		UIView.animate(withDuration: 0.5) {
			self.layoutConstraintBottom.constant = 0
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTakeImage(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionEmoji(_ sender: UIButton) {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "Comments2Cell1", for: indexPath) as! Comments2Cell1
		cell.bindData(index: indexPath.item, data: comments[indexPath.row])
		cell.updateUIBlock = { () in
			DispatchQueue.main.async {
				UIView.setAnimationsEnabled(false)
				self.tableView.beginUpdates()
				self.tableView.endUpdates()
				UIView.setAnimationsEnabled(true)
			}
		}
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
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
