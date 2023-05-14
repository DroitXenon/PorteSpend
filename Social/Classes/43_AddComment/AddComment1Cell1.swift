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
class AddComment1Cell1: UITableViewCell {

	@IBOutlet var imageUserProfile: UIImageView!
	@IBOutlet var labelUserName: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var layoutConstraintDescriptionHeight: NSLayoutConstraint!
	@IBOutlet var labelLikeCount: UILabel!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var buttonReplay: UIButton!
	@IBOutlet var buttonLike: UIButton!

	@IBOutlet var viewSeeAllReplay: UIView!
	@IBOutlet var labelSeeAllReplay: UILabel!
	@IBOutlet var buttonSeeAllReplay: UIButton!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var comments: [[String: Any]] = []
	private var isSeeAllDisplay = true

	var updateUIBlock: (()->())?

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		tableView.register(UINib(nibName: "AddComment1Cell2", bundle: Bundle.main), forCellReuseIdentifier: "AddComment1Cell2")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: Any]) {

		guard let name = data["name"] as? String else { return }
		guard let comment = data["comment"] as? String else { return }
		guard let likes = data["likes"] as? String else { return }
		guard let time = data["time"] as? String else { return }
		guard let replies = data["replies"] as? String else { return }
		guard let otherComments = data["otherComments"] as? [String: Any] else { return }

		imageUserProfile.sample("Social", "Profiles", index)
		labelUserName.text = name
		labelDescription.text = comment
		labelLikeCount.text = likes
		labelTime.text = time
		labelSeeAllReplay.text = replies
		comments = [otherComments]

		if let descriptionHeight = labelDescription.text?.height(withConstrainedWidth: labelDescription.frame.size.width, font: UIFont.systemFont(ofSize: 12)) {
			layoutConstraintDescriptionHeight.constant = descriptionHeight
		}
		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		DispatchQueue.main.async {
			self.tableView.reloadData()
			self.tableView.layoutIfNeeded()
			self.layoutConstraintTableViewHeight.constant = self.tableView.contentSize.height

			UIView.setAnimationsEnabled(false)
			self.tableView.beginUpdates()
			self.tableView.endUpdates()
			UIView.setAnimationsEnabled(true)
		}
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReplay(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLike(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllReplay(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AddComment1Cell1: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return (comments.count > 0) ? 1 : 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return isSeeAllDisplay ? comments.count : 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "AddComment1Cell2", for: indexPath) as! AddComment1Cell2
		cell.bindData(index: indexPath.item, data: comments[indexPath.row])
		cell.updateUIBlock = { () in
			DispatchQueue.main.async {
				UIView.setAnimationsEnabled(false)
				tableView.beginUpdates()
				tableView.endUpdates()
				UIView.setAnimationsEnabled(true)

				self.layoutConstraintTableViewHeight.constant = tableView.contentSize.height
				if let block = self.updateUIBlock {
					block()
				}
			}
		}
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AddComment1Cell1: UITableViewDelegate {

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
