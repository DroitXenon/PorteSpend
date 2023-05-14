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
	@IBOutlet var buttonViewItems: UIButton!

	@IBOutlet var cellFeatured: UITableViewCell!
	@IBOutlet var cellNewItems: UITableViewCell!
	@IBOutlet var cellPriceHigh: UITableViewCell!
	@IBOutlet var cellPriceLow: UITableViewCell!

	@IBOutlet var viewFeatured: UIView!
	@IBOutlet var viewNewItems: UIView!
	@IBOutlet var viewPriceHigh: UIView!
	@IBOutlet var viewPriceLow: UIView!

	@IBOutlet var cellSize: UITableViewCell!
	@IBOutlet var cellBrand: UITableViewCell!
	@IBOutlet var cellColor: UITableViewCell!
	@IBOutlet var cellPrice: UITableViewCell!
	@IBOutlet var cellRange: UITableViewCell!

	@IBOutlet var labelSize: UILabel!
	@IBOutlet var labelBrand: UILabel!
	@IBOutlet var labelColor: UILabel!
	@IBOutlet var labelPrice: UILabel!
	@IBOutlet var labelRange: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Filters"

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(actionReset(_:)))
		setSelectedSortBy(view: viewFeatured)

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSize.text = "All"
		labelBrand.text = "Adidas Originals, Puma, HRX"
		labelColor.text = "Black"
		labelPrice.text = "$0-$999"
		labelRange.text = "All"

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - Helper Methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setSelectedSortBy(view: UIView) {

		viewFeatured.isHidden = true
		viewNewItems.isHidden = true
		viewPriceHigh.isHidden = true
		viewPriceLow.isHidden = true

		view.isHidden = false
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionReset(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionViewItems(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 4 }
		if (section == 1) { return 5 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellFeatured	}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellNewItems	}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellPriceHigh	}
		if (indexPath.section == 0) && (indexPath.row == 3) { return cellPriceLow	}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellSize	}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellBrand	}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellColor	}
		if (indexPath.section == 1) && (indexPath.row == 3) { return cellPrice	}
		if (indexPath.section == 1) && (indexPath.row == 4) { return cellRange	}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 50
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return "SORT BY" }
		if (section == 1) { return "CATEGORIES" }

		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			let viewY = header.frame.size.height - 1
			let view = UIView(frame: CGRect(x: 0, y: viewY, width: header.frame.size.width, height: 1))
			view.backgroundColor = .tertiarySystemFill
			view.tag = 1001
			header.contentView.subviews.forEach { (view) in
				if (view.tag == 1001) {
					view.removeFromSuperview()
				}
			}
			header.contentView.addSubview(view)
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)

		if (indexPath.section == 0) && (indexPath.row == 0) { setSelectedSortBy(view: viewFeatured)		}
		if (indexPath.section == 0) && (indexPath.row == 1) { setSelectedSortBy(view: viewNewItems)		}
		if (indexPath.section == 0) && (indexPath.row == 2) { setSelectedSortBy(view: viewPriceHigh)	}
		if (indexPath.section == 0) && (indexPath.row == 3) { setSelectedSortBy(view: viewPriceLow)		}

		if (indexPath.section == 1) && (indexPath.row == 0) {  }
		if (indexPath.section == 1) && (indexPath.row == 1) {  }
		if (indexPath.section == 1) && (indexPath.row == 2) {  }
		if (indexPath.section == 1) && (indexPath.row == 3) {  }
		if (indexPath.section == 1) && (indexPath.row == 4) {  }
	}
}
