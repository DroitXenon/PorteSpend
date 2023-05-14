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
class AddCommentView: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!
	@IBOutlet var textFieldComment: UITextField!
	@IBOutlet var layoutConstraintBottom: NSLayoutConstraint!

	private var comments: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldComment.attributedPlaceholder = NSAttributedString(string: "Write a comment…", attributes: attribute)

		tableView.register(UINib(nibName: "AddComment1Cell1", bundle: Bundle.main), forCellReuseIdentifier: "AddComment1Cell1")
		tableView.register(UINib(nibName: "AddComment1Cell2", bundle: Bundle.main), forCellReuseIdentifier: "AddComment1Cell2")

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

		labelTitle.text = "48 comments"

		comments.removeAll()

		var dict1: [String: Any] = [:]
		dict1["name"] = "Dave Smith"
		dict1["comment"] = "In the history of modern astronomy, there is probably no one greater leap forward"
		dict1["likes"] = "2 likes"
		dict1["time"] = "13 min"
		dict1["replies"] = "See all 34 replies"
		dict1["otherComments"] = dict1
		comments.append(dict1)

		var dict2: [String: Any] = [:]
		dict2["name"] = "Fernando Harris"
		dict2["comment"] = "Gorgeous!"
		dict2["likes"] = "0 likes"
		dict2["time"] = "2 hours"
		comments.append(dict2)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		DispatchQueue.main.async {
			self.tableView.reloadData()
			self.layoutConstraintTableViewHeight.constant = self.tableView.contentSize.height
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
	@IBAction func actionDone(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTakeImage(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionEmoji(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSend(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionReply(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionLike(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AddCommentView: UITableViewDataSource {

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

		if (indexPath.row == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "AddComment1Cell1", for: indexPath) as! AddComment1Cell1
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

		if (indexPath.row == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "AddComment1Cell2", for: indexPath) as! AddComment1Cell2
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

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AddCommentView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		self.layoutConstraintTableViewHeight.constant = self.tableView.contentSize.height
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
