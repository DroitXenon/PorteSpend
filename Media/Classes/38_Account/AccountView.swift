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
class AccountView: UIViewController {

	@IBOutlet var labelUsername: UILabel!
	@IBOutlet var labelEmail: UILabel!
	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var tableView: UITableView!

	private var navigationBackgroundImage: UIImage?
	private var items: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		tableView.register(UINib(nibName: "AccountCell", bundle: nil), forCellReuseIdentifier: "AccountCell")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelUsername.text = "John Smith"
		labelEmail.text = "info@related.blog"

		items.removeAll()

		var section1Settings: [[String: Any]] = []
		var section1Dict: [String: Any] = [:]
		var section2Settings: [[String: Any]] = []
		var section2Dict: [String: Any] = [:]
		var section3Settings: [[String: Any]] = []
		var section3Dict: [String: Any] = [:]

		var dict1: [String: Any] = [:]
		dict1["image"] = "video.fill"
		dict1["title"] = "My Channel"
		dict1["value"] = ""

		var dict2: [String: Any] = [:]
		dict2["image"] = "arrow.2.circlepath"
		dict2["title"] = "Switch Account"
		dict2["value"] = ""

		section1Settings = [dict1, dict2]

		section1Dict["title"] = ""
		section1Dict["data"] = section1Settings

		var dict3: [String: Any] = [:]
		dict3["image"] = ""
		dict3["title"] = "Subscribed Channels"
		dict3["value"] = "84"

		var dict4: [String: Any] = [:]
		dict4["image"] = ""
		dict4["title"] = "My Videos"
		dict4["value"] = "392"

		var dict5: [String: Any] = [:]
		dict5["image"] = ""
		dict5["title"] = "Saved Videos"
		dict5["value"] = "51"
		section2Settings = [dict3, dict4, dict5]

		section2Dict["title"] = "Media"
		section2Dict["data"] = section2Settings

		var dict6: [String: Any] = [:]
		dict6["image"] = ""
		dict6["title"] = "Theme"
		dict6["value"] = "Dark"

		var dict7: [String: Any] = [:]
		dict7["image"] = ""
		dict7["title"] = "Language"
		dict7["value"] = "English"

		var dict8: [String: Any] = [:]
		dict8["image"] = ""
		dict8["title"] = "Settings"
		dict8["value"] = ""
		section3Settings = [dict6, dict7, dict8]

		section3Dict["title"] = "Other"
		section3Dict["data"] = section3Settings

		items = [section1Dict, section2Dict, section3Dict]

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AccountView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return items.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if let dataCount = items[section]["data"] as? [[String: Any]] {
			return dataCount.count
		}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if let dataCount = items[section]["title"] as? String {
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

		if let dataCount = items[indexPath.section]["data"] as? [[String: Any]] {
			let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
			cell.bindData(setting: dataCount[indexPath.row])
			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AccountView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
