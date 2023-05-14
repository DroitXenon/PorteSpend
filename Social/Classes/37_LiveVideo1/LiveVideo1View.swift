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
class LiveVideo1View: UIViewController {

	@IBOutlet var imageVideo: UIImageView!
	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelLive: UILabel!
	@IBOutlet var labelViewCount: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!
	@IBOutlet var textFieldComment: UITextField!

	private var comments: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		labelLive.layer.borderWidth = 1
		labelLive.layer.borderColor = AppColor.Border.cgColor

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldComment.attributedPlaceholder = NSAttributedString(string: "Write a comment…", attributes: attribute)

		tableView.register(UINib(nibName: "LiveVideo1Cell1", bundle: Bundle.main), forCellReuseIdentifier: "LiveVideo1Cell1")
		tableView.register(UINib(nibName: "LiveVideo1Cell2", bundle: Bundle.main), forCellReuseIdentifier: "LiveVideo1Cell2")
		refreshTableView()

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
		navigationController?.navigationBar.isHidden = false
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageVideo.sample("Social", "Party", 13)
		imageUser.sample("Social", "Portraits", 28)
		labelName.text = "John Smith"
		labelViewCount.text = "847"

		comments.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Betty Hansen"
		dict1["comment"] = "Amazing!"
		comments.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Emma Harris"
		dict2["comment"] = "I really like your style"
		comments.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Amy Roberts"
		dict3["comment"] = "joined"
		comments.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Brian Elwood"
		dict4["comment"] = "Love the colors"
		comments.append(dict4)

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
			self.layoutConstraintTableViewHeight.constant = self.tableView.contentSize.height
		}
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionEmoji(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionShare(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMore(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension LiveVideo1View: UITableViewDataSource {

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

		if (comments[indexPath.row]["comment"] != "joined") {
			let cell = tableView.dequeueReusableCell(withIdentifier: "LiveVideo1Cell1", for: indexPath) as! LiveVideo1Cell1
			cell.bindData(index: indexPath.item, data: comments[indexPath.row])
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "LiveVideo1Cell2", for: indexPath) as! LiveVideo1Cell2
			cell.bindData(data: comments[indexPath.row])
			return cell
		}
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension LiveVideo1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return (comments[indexPath.row]["comment"] != "joined") ? 40 : 30
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		dismiss(animated: true)
	}
}
