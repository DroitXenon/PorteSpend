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
class Filters1View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var filters: [[String: Any]] = []
	var section1SelectedItem = 0
	var section2SelectedItem = 0
	var section3SelectedItem = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Filters"

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(actionClose))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(actionDone))

		tableView.register(UINib(nibName: "Filters1Cell", bundle: nil), forCellReuseIdentifier: "Filters1Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		filters.removeAll()

		var section1Dict: [String: Any] = [:]
		var section2Dict: [String: Any] = [:]
		var section3Dict: [String: Any] = [:]

		section1Dict["title"] = "Sort by"
		section1Dict["data"] = ["Relevance", "Upload Date", "Views", "Rating"]

		section2Dict["title"] = "Features"
		section2Dict["data"] = ["4K", "HD", "360", "VR180"]

		section3Dict["title"] = "Upload Date"
		section3Dict["data"] = ["Anytime", "Live", "Today", "This Week", "This Month"]

		filters = [section1Dict, section2Dict, section3Dict]

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionClose() {

		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDone() {

		dismiss(animated: true, completion: nil)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return filters.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if let dataCount = filters[section]["data"] as? [String] {
			return dataCount.count
		}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if let title = filters[section]["title"] as? String {
			return title
		}

		return ""
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if let data = filters[indexPath.section]["data"] as? [String] {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Filters1Cell", for: indexPath) as! Filters1Cell
			cell.bindData(title: data[indexPath.row])
			var currentSelectedItem = 0
			if indexPath.section == 0 {
				currentSelectedItem = section1SelectedItem
			}
			else if indexPath.section == 1 {
				currentSelectedItem = section2SelectedItem
			}
			else if indexPath.section == 2 {
				currentSelectedItem = section3SelectedItem
			}
			if (currentSelectedItem == indexPath.row) {
				let imageName = indexPath.section == 1 ? "checkmark" : "circle.fill"
				cell.imageViewAccessory.image = UIImage(systemName: imageName)
				cell.imageViewAccessory.preferredSymbolConfiguration = .init(pointSize: (indexPath.section == 1 ? 20 : 12))
				cell.imageViewAccessory.isHidden = false
			}
			else {
				cell.imageViewAccessory.isHidden = true
			}
			return cell
		}
		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if indexPath.section == 0 {
			section1SelectedItem = indexPath.row
		}
		else if indexPath.section == 1 {
			section2SelectedItem = indexPath.row
		}
		else if indexPath.section == 2 {
			section3SelectedItem = indexPath.row
		}

		tableView.reloadSections(IndexSet(arrayLiteral: indexPath.section), with: .none)
	}
}
