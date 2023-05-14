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
class CompareItemsView: UIViewController {

	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var tableView: UITableView!

	@IBOutlet var viewLining: UIView!
	@IBOutlet var viewSole: UIView!
	@IBOutlet var viewUpper: UIView!
	@IBOutlet var viewBrand: UIView!

	@IBOutlet var imageLining: UIImageView!
	@IBOutlet var imageSole: UIImageView!
	@IBOutlet var imageUpper: UIImageView!
	@IBOutlet var imageBrand: UIImageView!

	@IBOutlet var cellProduct: UITableViewCell!
	@IBOutlet var cellLining: UITableViewCell!
	@IBOutlet var cellSole: UITableViewCell!
	@IBOutlet var cellUpper: UITableViewCell!
	@IBOutlet var cellBrand: UITableViewCell!

	@IBOutlet var collectionViewProduct: UICollectionView!
	@IBOutlet var collectionViewLining: UICollectionView!
	@IBOutlet var collectionViewSole: UICollectionView!
	@IBOutlet var collectionViewUpper: UICollectionView!
	@IBOutlet var collectionViewBrand: UICollectionView!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Compare Items"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		labelSubTitle.text = "3 items"

		imageLining.isHighlighted = true
		imageUpper.isHighlighted = true

		collectionViewProduct.register(UINib(nibName: "CompareItemsCell1", bundle: Bundle.main), forCellWithReuseIdentifier: "CompareItemsCell1")
		collectionViewLining.register(UINib(nibName: "CompareItemsCell2", bundle: Bundle.main), forCellWithReuseIdentifier: "CompareItemsCell2")
		collectionViewSole.register(UINib(nibName: "CompareItemsCell2", bundle: Bundle.main), forCellWithReuseIdentifier: "CompareItemsCell2")
		collectionViewUpper.register(UINib(nibName: "CompareItemsCell2", bundle: Bundle.main), forCellWithReuseIdentifier: "CompareItemsCell2")
		collectionViewBrand.register(UINib(nibName: "CompareItemsCell2", bundle: Bundle.main), forCellWithReuseIdentifier: "CompareItemsCell2")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Rick Point NU IDP Sneakers"
		dict1["brand"] = "Puma"
		dict1["price"] = "$599"
		dict1["originalPrice"] = "$1099"
		dict1["rating"] = "5"
		dict1["review"] = "28"
		dict1["lining"] = "100% Real Leather"
		dict1["sole"] = ""
		dict1["upper"] = "100% Textile"
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Unisex's Bari Sneakers"
		dict2["brand"] = "Sparx"
		dict2["price"] = "$760"
		dict2["originalPrice"] = ""
		dict2["rating"] = "3"
		dict2["review"] = "10"
		dict2["lining"] = "100% Real Leather"
		dict2["sole"] = ""
		dict2["upper"] = "Other Materials"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "K11 Speed Laces Sneakers"
		dict3["brand"] = "Mactree"
		dict3["price"] = "$463"
		dict3["originalPrice"] = ""
		dict3["rating"] = "4"
		dict3["review"] = "25"
		dict3["lining"] = "100% Real Leather"
		dict3["sole"] = ""
		dict3["upper"] = "100% Suede"
		products.append(dict3)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLining(_ sender: UIButton) {

		print(#function)
		imageLining.isHighlighted = !imageLining.isHighlighted
		tableView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSole(_ sender: UIButton) {

		print(#function)
		imageSole.isHighlighted = !imageSole.isHighlighted
		tableView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionUpper(_ sender: UIButton) {

		print(#function)
		imageUpper.isHighlighted = !imageUpper.isHighlighted
		tableView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionBrand(_ sender: UIButton) {

		print(#function)
		imageBrand.isHighlighted = !imageBrand.isHighlighted
		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CompareItemsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 5
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 1 }
		if (section == 1) { return imageLining.isHighlighted ? 1 : 0 }
		if (section == 2) { return imageSole.isHighlighted	 ? 1 : 0 }
		if (section == 3) { return imageUpper.isHighlighted	 ? 1 : 0 }
		if (section == 4) { return imageBrand.isHighlighted	 ? 1 : 0 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) { return cellProduct	}
		if (indexPath.section == 1) { return cellLining		}
		if (indexPath.section == 2) { return cellSole		}
		if (indexPath.section == 3) { return cellUpper		}
		if (indexPath.section == 4) { return cellBrand		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CompareItemsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 0 }
		if (section == 1) { return 50 }
		if (section == 2) { return 50 }
		if (section == 3) { return 50 }
		if (section == 4) { return 50 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		if (section == 1) { return viewLining	}
		if (section == 2) { return viewSole		}
		if (section == 3) { return viewUpper	}
		if (section == 4) { return viewBrand	}

		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 280 }
		if (indexPath.section == 1) { return 40 }
		if (indexPath.section == 2) { return 40 }
		if (indexPath.section == 3) { return 40 }
		if (indexPath.section == 4) { return 40 }

		return 0
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CompareItemsView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return products.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewProduct) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompareItemsCell1", for: indexPath) as! CompareItemsCell1
			cell.bindData(index: indexPath.item, data: products[indexPath.row])
			return cell
		}

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompareItemsCell2", for: indexPath) as! CompareItemsCell2

		if (collectionView == collectionViewLining)	{
			if let lining = products[indexPath.row]["lining"] {
				cell.bindData(info: lining)
			}
		}
		if (collectionView == collectionViewSole)	{
			if let sole = products[indexPath.row]["sole"] {
				cell.bindData(info: sole)
			}
		}
		if (collectionView == collectionViewUpper)	{
			if let upper = products[indexPath.row]["upper"] {
				cell.bindData(info: upper)
			}
		}
		if (collectionView == collectionViewBrand)	{
			if let brand = products[indexPath.row]["brand"] {
				cell.bindData(info: brand)
			}
		}

		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CompareItemsView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CompareItemsView: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-30)/2.4
		let height = collectionView.frame.size.height

		if (collectionView == collectionViewProduct) { return CGSize(width: width, height: 265) }

		return CGSize(width: width, height: height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 15
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 15
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionViewProduct) { return UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15) }
		return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CompareItemsView: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if (scrollView != collectionViewProduct)	{ collectionViewProduct.contentOffset.x = scrollView.contentOffset.x }
		if (scrollView != collectionViewLining)		{ collectionViewLining.contentOffset.x = scrollView.contentOffset.x }
		if (scrollView != collectionViewSole)		{ collectionViewSole.contentOffset.x = scrollView.contentOffset.x }
		if (scrollView != collectionViewUpper)		{ collectionViewUpper.contentOffset.x = scrollView.contentOffset.x }
		if (scrollView != collectionViewBrand)		{ collectionViewBrand.contentOffset.x = scrollView.contentOffset.x }
	}
}
