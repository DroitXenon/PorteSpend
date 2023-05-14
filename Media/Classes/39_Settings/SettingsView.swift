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
class SettingsView: UIViewController {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var labelUsername: UILabel!
	@IBOutlet var labelEmail: UILabel!
	@IBOutlet var tableView: UITableView!

	private var settings: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Settings"

		tableView.register(UINib(nibName: "SettingsCell", bundle: nil), forCellReuseIdentifier: "SettingsCell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelUsername.text = "John Smith"
		labelEmail.text = "info@related.blog"

		settings.removeAll()

		var section1Settings: [[String: Any]] = []
		var section1Dict: [String: Any] = [:]
		var section2Settings: [[String: Any]] = []
		var section2Dict: [String: Any] = [:]
		var section3Settings: [[String: Any]] = []
		var section3Dict: [String: Any] = [:]

		var dict1: [String: Any] = [:]
		dict1["title"] = "Play HD on Wi-Fi"
		dict1["value"] = ""
		dict1["isSwitch"] = true

		var dict2: [String: Any] = [:]
		dict2["title"] = "Double Tap to Seek"
		dict2["value"] = "15 sec"
		dict2["isSwitch"] = false

		var dict3: [String: Any] = [:]
		dict3["title"] = "Watch on TV"
		dict3["value"] = ""
		dict3["isSwitch"] = false

		var dict4: [String: Any] = [:]
		dict4["title"] = "Location"
		dict4["value"] = " Russia"
		dict4["isSwitch"] = false
		section1Settings = [dict1, dict2, dict3, dict4]

		section1Dict["title"] = "Video"
		section1Dict["data"] = section1Settings

		var dict5: [String: Any] = [:]
		dict5["title"] = "Notifications"
		dict5["value"] = " "
		dict5["isSwitch"] = false
		section2Settings = [dict5]

		section2Dict["title"] = ""
		section2Dict["data"] = section2Settings

		var dict6: [String: Any] = [:]
		dict6["title"] = "Watch History"
		dict6["value"] = ""
		dict6["isSwitch"] = false

		var dict7: [String: Any] = [:]
		dict7["title"] = "Search History"
		dict7["value"] = ""
		dict7["isSwitch"] = false
		section3Settings = [dict6, dict7]

		section3Dict["title"] = "Privacy"
		section3Dict["data"] = section3Settings

		settings = [section1Dict, section2Dict, section3Dict]

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionEdit(_ sender: Any) {

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
extension SettingsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return settings.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if let dataCount = settings[section]["data"] as? [[String: Any]] {
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

		if let dataCount = settings[indexPath.section]["data"] as? [[String: Any]] {
			let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
			cell.bindData(setting: dataCount[indexPath.row])
			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SettingsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
