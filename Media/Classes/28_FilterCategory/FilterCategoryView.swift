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
class FilterCategoryView: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var buttonView: UIButton!

	private var categories = ["4K", "HD", "360", "VR180"]

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Features"

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select All", style: .done, target: self, action: #selector(actionSelectAll))

		tableView.register(UINib(nibName: "FilterCategoryCell", bundle: nil), forCellReuseIdentifier: "FilterCategoryCell")

		tableView.tableFooterView = UIView()

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		buttonView.setTitle("View 2.3K videos", for: .normal)
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSelectAll() {

		for row in 0..<tableView.numberOfRows(inSection: 0) {
			let indexPath = IndexPath(row: row, section: 0)
			_ = tableView.delegate?.tableView?(tableView, willSelectRowAt: indexPath)
			tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
			tableView.delegate?.tableView?(tableView, didSelectRowAt: indexPath)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionViewVideos(_ sender: Any) {

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
extension FilterCategoryView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return categories.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCategoryCell", for: indexPath) as! FilterCategoryCell
		cell.bindData(title: categories[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FilterCategoryView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		let cell = tableView.cellForRow(at: indexPath) as! FilterCategoryCell
		cell.imageViewAccessory.isHidden = false
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

		print("didDeSelectItemAt \(indexPath.row)")

		let cell = tableView.cellForRow(at: indexPath) as! FilterCategoryCell
		cell.imageViewAccessory.isHidden = true
	}
}
