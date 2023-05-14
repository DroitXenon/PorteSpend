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
class Items1View: UIViewController {

	@IBOutlet var viewTitle: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var viewSortBy: UIView!
	@IBOutlet var viewFilters: UIView!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		labelTitle.text = "Shoes"
		labelSubTitle.text = "13.4K items"

		viewSortBy.layer.borderWidth = 1
		viewSortBy.layer.borderColor = AppColor.Border.cgColor

		viewFilters.layer.borderWidth = 1
		viewFilters.layer.borderColor = AppColor.Border.cgColor

		navigationItem.titleView = viewTitle
		collectionView.register(UINib(nibName: "Items1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Items1Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Suede Chukka Boots"
		dict1["brand"] = "River Island"
		dict1["price"] = "$79.00"
		dict1["originalPrice"] = ""
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Platform Derby Shoes"
		dict2["brand"] = "Stella McCartney"
		dict2["price"] = "$384.00"
		dict2["originalPrice"] = "$640.00"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Hiking boots"
		dict3["brand"] = "Dolce & Gabbana"
		dict3["price"] = "$59.00"
		dict3["originalPrice"] = "$70.00"
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Motocross boots"
		dict4["brand"] = "Hermes"
		dict4["price"] = "$48.00"
		dict4["originalPrice"] = ""
		products.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Riding boots"
		dict5["brand"] = "Armani"
		dict5["price"] = "$98.00"
		dict5["originalPrice"] = ""
		products.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Jodhpur Boots"
		dict6["brand"] = "House of Versace"
		dict6["price"] = "$75.00"
		dict6["originalPrice"] = "$97.00"
		products.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Rezz Casual Sneaker"
		dict7["brand"] = "Tommy Hilfiger"
		dict7["price"] = "$54.99"
		dict7["originalPrice"] = "$139.50"
		products.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "Ward Low Top Sneaker"
		dict8["brand"] = "Vans"
		dict8["price"] = "$34.00"
		dict8["originalPrice"] = ""
		products.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = "Air Max Motion"
		dict9["brand"] = "Nike"
		dict9["price"] = "$64.00"
		dict9["originalPrice"] = ""
		products.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Trainers"
		dict10["brand"] = "H&M"
		dict10["price"] = "$59.00"
		dict10["originalPrice"] = "$125.00"
		products.append(dict10)

		var dict11: [String: String] = [:]
		dict11["title"] = "Suede Chukka Boots"
		dict11["brand"] = "River Island"
		dict11["price"] = "$79.00"
		dict11["originalPrice"] = ""
		products.append(dict11)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSortBy(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFilter(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFavorite(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items1View: UICollectionViewDataSource {

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

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Items1Cell1", for: indexPath) as! Items1Cell1
		cell.bindData(index: indexPath.item, data: products[indexPath.row])
		cell.buttonFavorite.tag = indexPath.row
		cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-45)/2
		return CGSize(width: width, height: (width*1.3))
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

		return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
	}
}
