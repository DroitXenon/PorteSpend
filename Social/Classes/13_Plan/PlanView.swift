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
class PlanView: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableViewHeight: NSLayoutConstraint!
	@IBOutlet var labelDescription: UILabel!

	private var plans: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationItem.titleView = UIImageView(image: UIImage(systemName: "circles.hexagongrid.fill"))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .done, target: self, action: #selector(actionSkip))

		tableView.register(UINib(nibName: "PlanCell", bundle: nil), forCellReuseIdentifier: "PlanCell")
		tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Subscription\nPlan"
		labelSubTitle.text = "Biggest collection\nof news, article & news"
		labelDescription.text = "Choose plan to access various\ncontent for defined time period"

		plans.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Start - Free"
		dict1["description"] = "Learn, explore, and create"
		plans.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Professional - $19/m"
		dict2["description"] = "A good fit for landing pages"
		plans.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Team - $48/mo"
		dict3["description"] = "For more complex projects"
		plans.append(dict3)

		refreshTableView()
	}

	// MARK: - Tableview Observer
	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

		if let obj = object as? UITableView {
			if obj == tableView && keyPath == "contentSize" {
				if let newSize = change?[NSKeyValueChangeKey.newKey] as? CGSize {
					constraintTableViewHeight.constant = newSize.height
				}
			}
		}
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSkip() {

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
extension PlanView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return plans.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath) as! PlanCell
		cell.bindData(data: plans[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension PlanView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		let cell = tableView.cellForRow(at: indexPath) as! PlanCell
		cell.imageViewAccessory.image = UIImage(systemName: "smallcircle.fill.circle.fill")
		cell.imageViewAccessory.tintColor = AppColor.Theme
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

		print("didDeSelectItemAt \(indexPath.row)")

		let cell = tableView.cellForRow(at: indexPath) as! PlanCell
		cell.imageViewAccessory.image = UIImage(systemName: "circle.fill")
		cell.imageViewAccessory.tintColor = UIColor.secondaryLabel
	}
}
