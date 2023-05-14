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
class LiveVideo2View: UIViewController {

	@IBOutlet var imageVideo: UIImageView!
	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelLiveTime: UILabel!
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

		tableView.register(UINib(nibName: "LiveVideo2Cell1", bundle: Bundle.main), forCellReuseIdentifier: "LiveVideo2Cell1")
		tableView.register(UINib(nibName: "LiveVideo2Cell2", bundle: Bundle.main), forCellReuseIdentifier: "LiveVideo2Cell2")

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

		imageVideo.sample("Social", "Party", 15)
		imageUser.sample("Social", "Portraits", 28)
		labelName.text = "John Smith"
		labelLiveTime.text = "02:41:21"
		labelViewCount.text = "847"

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldComment.attributedPlaceholder = NSAttributedString(string: "Write a comment…", attributes: attribute)

		comments.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Alan Nickerson"
		dict1["comment"] = "A new masterpiece every day!"
		comments.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Brian Elwood"
		dict2["comment"] = "In the history of modern astronomy, there is probably no one greater leap forward"
		comments.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Chris Michael"
		dict3["comment"] = "Amazing!"
		comments.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Dave Smith"
		dict4["comment"] = "joined"
		comments.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Egon Pratt"
		dict5["comment"] = "Love the colors"
		comments.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Fernando Harris"
		dict6["comment"] = "joined"
		comments.append(dict6)

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
extension LiveVideo2View: UITableViewDataSource {

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
			let cell = tableView.dequeueReusableCell(withIdentifier: "LiveVideo2Cell1", for: indexPath) as! LiveVideo2Cell1
			cell.bindData(index: indexPath.item, data: comments[indexPath.row])
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "LiveVideo2Cell2", for: indexPath) as! LiveVideo2Cell2
			cell.bindData(data: comments[indexPath.row])
			return cell
		}
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension LiveVideo2View: UITableViewDelegate {

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

		dismiss(animated: true)
	}
}
