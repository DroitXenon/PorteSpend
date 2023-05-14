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
class Profile2View: UIViewController {

	@IBOutlet var buttonFollow: UIButton!
	@IBOutlet var viewFollow: UIView!
	@IBOutlet var viewHeader: UIView!
	@IBOutlet var buttonMessage: UIButton!
	@IBOutlet var buttonMenu: UIButton!
	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var imageVerified: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelWork: UILabel!
	@IBOutlet var segmentedControl: UISegmentedControl!
	@IBOutlet var tableView: UITableView!

	private var feeds: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Profile"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewFollow)

		buttonMessage.layer.borderWidth = 1
		buttonMessage.layer.borderColor = AppColor.Border.cgColor

		buttonMenu.layer.borderWidth = 1
		buttonMenu.layer.borderColor = AppColor.Border.cgColor

		tableView.register(UINib(nibName: "Profile2Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Profile2Cell1")
		tableView.register(UINib(nibName: "Profile2Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Profile2Cell2")

		loadData()
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Profiles", 14)
		labelName.text = "John Smith"
		labelWork.text = "Designer at App Design Kit"

		feeds.removeAll()

		var dict1: [String: Any] = [:]
		dict1["name"] = "Chris Michael"
		dict1["time"] = "2 min ago"
		dict1["content"] = "Never put off till tomorrow what may be done day after tomorrow just as well."
		dict1["likes"] = "89.4K likes"
		dict1["comments"] = "93 comments"
		feeds.append(dict1)

		var dict2: [String: Any] = [:]
		dict2["name"] = "Amy Roberts"
		dict2["time"] = "1 hour ago"
		dict2["images"] = 10
		dict2["likes"] = "89.4K likes"
		dict2["comments"] = "93 comments"
		feeds.append(dict2)

		refreshTableView()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		let background = UIColor.systemBackground.image(segmentedControl.frame.size)
		let selected = AppColor.Theme.image(segmentedControl.frame.size)

		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
		segmentedControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
		segmentedControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
		segmentedControl.setDividerImage(AppColor.Theme.image(), forLeftSegmentState: .normal, rightSegmentState: [.normal, .highlighted, .selected], barMetrics: .default)
		segmentedControl.layer.borderWidth = 1
		segmentedControl.layer.borderColor = AppColor.Theme.cgColor
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFollow(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMessage(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionLike(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionComment(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return 2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.row == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Profile2Cell1", for: indexPath) as! Profile2Cell1
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			cell.buttonlike.addTarget(self, action: #selector(actionLike(_:)), for: .touchUpInside)
			cell.buttonComment.addTarget(self, action: #selector(actionComment(_:)), for: .touchUpInside)
			cell.buttonShare.addTarget(self, action: #selector(actionShare(_:)), for: .touchUpInside)
			cell.bindData(data: feeds[0])
			return cell
		}
		if (indexPath.row == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Profile2Cell2", for: indexPath) as! Profile2Cell2
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			cell.buttonlike.addTarget(self, action: #selector(actionLike(_:)), for: .touchUpInside)
			cell.buttonComment.addTarget(self, action: #selector(actionComment(_:)), for: .touchUpInside)
			cell.buttonShare.addTarget(self, action: #selector(actionShare(_:)), for: .touchUpInside)
			cell.bindData(data: feeds[1])
			return cell
		}
		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 265
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return viewHeader
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - UIColor
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension UIColor {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

		return UIGraphicsImageRenderer(size: size).image { rendererContext in
			setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}
