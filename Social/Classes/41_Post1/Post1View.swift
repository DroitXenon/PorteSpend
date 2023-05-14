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
class Post1View: UIViewController {

	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelUser: UILabel!
	@IBOutlet var labelLocation: UILabel!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var layoutConstraintDescriptionHeight: NSLayoutConstraint!
	@IBOutlet var labelLikeCount: UILabel!
	@IBOutlet var labelCommentCount: UILabel!
	@IBOutlet var labelShareCount: UILabel!

	@IBOutlet var tableView1: UITableView!
	@IBOutlet var tableView2: UITableView!
	@IBOutlet var layoutConstraintTableView1Height: NSLayoutConstraint!
	@IBOutlet var layoutConstraintTableView2Height: NSLayoutConstraint!

	private var musics: [[String: String]] = []
	private var comments: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		tableView1.register(UINib(nibName: "Post1Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Post1Cell1")
		tableView2.register(UINib(nibName: "Post1Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Post1Cell2")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
		navigationController?.navigationBar.isHidden = false
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillLayoutSubviews() {

		super.viewWillLayoutSubviews()
		self.layoutConstraintTableView1Height.constant = self.tableView1.contentSize.height
		self.layoutConstraintTableView2Height.constant = self.tableView2.contentSize.height
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageUser.sample("Social", "Profiles", 14)
		labelUser.text = "John Smith"
		labelLocation.text = "New York, USA"
		labelTime.text = "2 min ago"
		labelDescription.text = "Begin to take your love of astronomy seriously, the thing that is on your mind."
		labelLikeCount.text = "516 likes"
		labelCommentCount.text = "8 comments"
		labelShareCount.text = "61 shares"

		if let descriptiontHeight = labelDescription.text?.height(withConstrainedWidth: labelDescription.frame.size.width, font: UIFont.systemFont(ofSize: 16)) {
			layoutConstraintDescriptionHeight.constant = descriptiontHeight
		}

		musics.removeAll()
		comments.removeAll()

		var dict1: [String: String] = [:]
		dict1["music"] = "Girls Like You"
		dict1["artist"] = "Maroon 5 feat. Cardi B"
		dict1["time"] = "03:45"
		musics.append(dict1)

		var dict2: [String: String] = [:]
		dict2["music"] = "Sicko Mode"
		dict2["artist"] = "Travis Scott"
		dict2["time"] = "04:14"
		musics.append(dict2)

		var dict3: [String: String] = [:]
		dict3["music"] = "Better Now"
		dict3["artist"] = "Post Malone"
		dict3["time"] = "03:45"
		musics.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Chloe Adams"
		dict4["time"] = "2 min ago"
		dict4["comment"] = "Lovely work. Nice photos."
		dict4["likes"] = "45 likes"
		comments.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Fabia Smith"
		dict5["time"] = "45 min ago"
		dict5["comment"] = "It is a masterpiece =)"
		dict5["likes"] = "45 likes"
		comments.append(dict5)

		refreshTableView1()
		refreshTableView2()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView1() {

		self.tableView1.reloadData()
		self.layoutConstraintTableView1Height.constant = self.tableView1.contentSize.height
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView2() {

		self.tableView2.reloadData()
		self.layoutConstraintTableView2Height.constant = self.tableView2.contentSize.height
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionBack(_ sender: UIButton) {

		print(#function)
		navigationController?.popViewController(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLike(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionComment(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCommentMore(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCommentReply(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCommentLike(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Post1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (tableView == tableView1) { return musics.count		}
		if (tableView == tableView2) { return comments.count	}
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (tableView == tableView1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Post1Cell1", for: indexPath) as! Post1Cell1
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			cell.bindData(data: musics[indexPath.row])
			return cell
		}
		if (tableView == tableView2) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Post1Cell2", for: indexPath) as! Post1Cell2
			cell.buttonMore.addTarget(self, action: #selector(actionCommentMore(_:)), for: .touchUpInside)
			cell.buttonReply.addTarget(self, action: #selector(actionCommentReply(_:)), for: .touchUpInside)
			cell.buttonLike.addTarget(self, action: #selector(actionCommentLike(_:)), for: .touchUpInside)
			cell.bindData(index: indexPath.item, data: comments[indexPath.row])
			return cell
		}
		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Post1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - String
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension String {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.width)
	}
}
