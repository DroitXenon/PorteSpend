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
class Filters2View: UIViewController {

	@IBOutlet var tableView1: UITableView!
	@IBOutlet var constraintTableView1Height: NSLayoutConstraint!
	@IBOutlet var tableView2: UITableView!
	@IBOutlet var constraintTableView2Height: NSLayoutConstraint!
	@IBOutlet var tableView3: UITableView!
	@IBOutlet var constraintTableView3Height: NSLayoutConstraint!
	@IBOutlet var tableView4: UITableView!
	@IBOutlet var constraintTableView4Height: NSLayoutConstraint!

	private var features = ["Relevance", "Upload Date", "Views", "Rating"]
	private var uploadedDates = ["Anytime", "Live", "Today", "This Week", "This Month"]
	private var durations = ["All", "Short < 4m", "Long > 20m"]
	private var types = ["Video", "Channel"]

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Filters"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .done, target: self, action: #selector(actionReset))

		tableView1.register(UINib(nibName: "Filters2Cell", bundle: nil), forCellReuseIdentifier: "Filters2Cell")
		tableView2.register(UINib(nibName: "Filters2Cell", bundle: nil), forCellReuseIdentifier: "Filters2Cell")
		tableView3.register(UINib(nibName: "Filters2Cell", bundle: nil), forCellReuseIdentifier: "Filters2Cell")
		tableView4.register(UINib(nibName: "Filters2Cell", bundle: nil), forCellReuseIdentifier: "Filters2Cell")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintTableView1Height.constant = tableView1.contentSize.height
		constraintTableView2Height.constant = tableView2.contentSize.height
		constraintTableView3Height.constant = tableView3.contentSize.height
		constraintTableView4Height.constant = tableView4.contentSize.height
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .automatic
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionReset() {

		dismiss(animated: true, completion: nil)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView1() {

		tableView1.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView2() {

		tableView2.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView3() {

		tableView3.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView4() {

		tableView4.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if tableView == tableView1 {
			return features.count
		}
		if tableView == tableView2 {
			return uploadedDates.count
		}
		if tableView == tableView3 {
			return durations.count
		}
		if tableView == tableView4 {
			return types.count
		}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Filters2Cell", for: indexPath) as! Filters2Cell
		if tableView == tableView1 {
			cell.imageViewAccessory.image = UIImage(systemName: "checkmark")
			cell.bindData(title: features[indexPath.row])
		}
		if tableView == tableView2 {
			cell.imageViewAccessory.image = UIImage(systemName: "circle.fill")
			cell.bindData(title: uploadedDates[indexPath.row])
		}
		if tableView == tableView3 {
			cell.imageViewAccessory.image = UIImage(systemName: "circle.fill")
			cell.bindData(title: durations[indexPath.row])
		}
		if tableView == tableView4 {
			cell.imageViewAccessory.image = UIImage(systemName: "circle.fill")
			cell.bindData(title: types[indexPath.row])
		}
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		let cell = tableView.cellForRow(at: indexPath) as! Filters2Cell
		cell.imageViewAccessory.isHidden = false
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

		print("didDeSelectItemAt \(indexPath.row)")

		let cell = tableView.cellForRow(at: indexPath) as! Filters2Cell
		cell.imageViewAccessory.isHidden = true
	}
}
