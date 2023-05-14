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
class CategoriesView: UIViewController {

	@IBOutlet var collectionView1: UICollectionView!
	@IBOutlet var collectionView2: UICollectionView!

	private var categories1 = ["EUROPE", "ASIA", "AFRICA", "SOUTH AMERICA", "NORTH AMERICA"]
	private var categories2: [[String: String]] = []
	private var selectedCategory = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Places"

		navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .done, target: self, action: #selector(actionProfile)), UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .done, target: self, action: #selector(actionWishlist))]

		collectionView1.register(UINib(nibName: "CategoriesCell1", bundle: Bundle.main), forCellWithReuseIdentifier: "CategoriesCell1")
		collectionView2.register(UINib(nibName: "CategoriesCell2", bundle: Bundle.main), forCellWithReuseIdentifier: "CategoriesCell2")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		categories2.removeAll()

		var dict1: [String: String] = [:]
		dict1["category"] = "India"
		dict1["tours"] = "238 Tours"
		categories2.append(dict1)

		var dict2: [String: String] = [:]
		dict2["category"] = "China"
		dict2["tours"] = "300 Tours"
		categories2.append(dict2)

		var dict3: [String: String] = [:]
		dict3["category"] = "Japan"
		dict3["tours"] = "200 Tours"
		categories2.append(dict3)

		var dict4: [String: String] = [:]
		dict4["category"] = "Thailand"
		dict4["tours"] = "147 Tours"
		categories2.append(dict4)

		categories2.append(dict1)
		categories2.append(dict2)
		categories2.append(dict3)
		categories2.append(dict4)

		refreshCollectionView2()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionWishlist() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionProfile() {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView1() {

		collectionView1.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView2() {

		collectionView2.reloadData()
	}
}

// MARK:- UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CategoriesView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if collectionView == collectionView1 { return categories1.count }
		if collectionView == collectionView2 { return categories2.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if collectionView == collectionView1 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell1", for: indexPath) as! CategoriesCell1
			cell.bindData(category: categories1[indexPath.row])
			if (selectedCategory == indexPath.row) {
				cell.viewBackground.backgroundColor = AppColor.Theme
				cell.labelCategory.textColor = UIColor.white
			}
			else {
				cell.viewBackground.backgroundColor = UIColor.white
				cell.labelCategory.textColor = UIColor.black
			}
			return cell
		}
		if collectionView == collectionView2 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell2", for: indexPath) as! CategoriesCell2
			cell.bindData(index: indexPath.item, data: categories2[indexPath.row])
			return cell
		}
		return UICollectionViewCell()
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CategoriesView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		if collectionView == collectionView1 {
			selectedCategory = indexPath.row
			collectionView1.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
			collectionView1.reloadItems(at: collectionView1.indexPathsForVisibleItems)
		}
		if collectionView == collectionView2 {
			print("didSelectItemAt \(indexPath.row)")
		}
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CategoriesView: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let height = collectionView.frame.size.height
		let width = collectionView.frame.size.width

		if collectionView == collectionView1 {
			return CGSize(width: width/4.5, height: height)
		}
		if collectionView == collectionView2 {
			return CGSize(width: (width-40)/2, height: height / 2.7)
		}
		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if collectionView == collectionView1 {
			return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		}
		if collectionView == collectionView2 {
			return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		}
		return UIEdgeInsets.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}
}
