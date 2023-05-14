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
class Settings1View: UIViewController {

	@IBOutlet var imageViewUser: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelEmail: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableviewHeight: NSLayoutConstraint!

	private var settings: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Settings"

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore))

		tableView.register(UINib(nibName: "Settings1Cell", bundle: nil), forCellReuseIdentifier: "Settings1Cell")

		loadData()

		constraintTableviewHeight.constant = tableView.contentSize.height
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelName.text = "John Smith"
		labelEmail.text = "info@related.blog"

		settings.removeAll()

		var section1Settings: [[String: String]] = []
		var section1Dict: [String: Any] = [:]
		var section2Settings: [[String: String]] = []
		var section2Dict: [String: Any] = [:]

		var dict1: [String: String] = [:]
		dict1["image"] = "bell.fill"
		dict1["title"] = "Notification"

		var dict2: [String: String] = [:]
		dict2["image"] = "person.2.fill"
		dict2["title"] = "Friends"

		var dict3: [String: String] = [:]
		dict3["image"] = "camera.fill"
		dict3["title"] = "Photos & Camera"
		section1Settings = [dict1, dict2, dict3]

		section1Dict["title"] = "Title"
		section1Dict["data"] = section1Settings

		var dict4: [String: String] = [:]
		dict4["image"] = "info.circle.fill"
		dict4["title"] = "Report a Problem"

		var dict5: [String: String] = [:]
		dict5["image"] = "heart.fill"
		dict5["title"] = "Help"

		var dict6: [String: String] = [:]
		dict6["image"] = "info.circle"
		dict6["title"] = "Terms and Conditions"
		section2Settings = [dict4, dict5, dict6]

		section2Dict["title"] = "Title"
		section2Dict["data"] = section2Settings

		settings = [section1Dict, section2Dict]

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore() {

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
extension Settings1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return settings.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if let dataCount = settings[section]["data"] as? [[String: String]] {
			return dataCount.count
		}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if let dataCount = settings[section]["title"] as? String {
			return dataCount
		}

		return ""
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if let dataCount = settings[indexPath.section]["data"] as? [[String: String]] {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Settings1Cell", for: indexPath) as! Settings1Cell
			cell.bindData(setting: dataCount[indexPath.row])
			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Settings1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
