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
class Items8View: UIViewController {

	@IBOutlet var viewTitle: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var collectionView: UICollectionView!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		labelTitle.text = "Clothes"
		labelSubTitle.text = "81.4K items"

		navigationItem.titleView = viewTitle

		let buttonSortBy = UIBarButtonItem(image: UIImage(systemName: "text.alignleft"), style: .plain, target: self, action: #selector(actionSortBy))
		let buttonFilter = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(actionFilter))
		navigationItem.rightBarButtonItems = [buttonFilter, buttonSortBy]

		collectionView.register(UINib(nibName: "Items8Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Items8Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Printed Slim Fit Casual Shirt"
		dict1["brand"] = "Spykar"
		dict1["price"] = "$599"
		dict1["originalPrice"] = "$1099"
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Blue Full Sleeves Formal Shirt"
		dict2["brand"] = "Peter England"
		dict2["price"] = "$760"
		dict2["originalPrice"] = ""
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Van Heusen Grey Shirt"
		dict3["brand"] = "Van Heusen"
		dict3["price"] = "$463"
		dict3["originalPrice"] = ""
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Black Barocco Track Jacket"
		dict4["brand"] = "Versace"
		dict4["price"] = "$1500"
		dict4["originalPrice"] = "$2100"
		products.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Permapress White Shirt"
		dict5["brand"] = "Louis Phillipe"
		dict5["price"] = "$999"
		dict5["originalPrice"] = ""
		products.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Regular fit Casual Shirt"
		dict6["brand"] = "Red Tape"
		dict6["price"] = "$799"
		dict6["originalPrice"] = ""
		products.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Slim fit Casual Shirt"
		dict7["brand"] = "KILLER"
		dict7["price"] = "$879"
		dict7["originalPrice"] = "$1250"
		products.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "Full Sleeve Casual Shirt"
		dict8["brand"] = "Campus Sutra"
		dict8["price"] = "$780"
		dict8["originalPrice"] = ""
		products.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = "Solid Regular Fit Casual Shirt"
		dict9["brand"] = "Jack & Jones"
		dict9["price"] = "$1299"
		dict9["originalPrice"] = "2500"
		products.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Checkered Slim fit Shirt"
		dict10["brand"] = "Indian Terrain"
		dict10["price"] = "$1209"
		dict10["originalPrice"] = ""
		products.append(dict10)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSortBy(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFilter(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items8View: UICollectionViewDataSource {

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

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Items8Cell1", for: indexPath) as! Items8Cell1
		cell.bindData(index: indexPath, data: products[indexPath.row])
		cell.buttonMore.tag = indexPath.row
		cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items8View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items8View: UICollectionViewDelegateFlowLayout {

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
