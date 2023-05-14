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
class Home1View: UIViewController {

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var buttonProfile: UIButton!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var collectionViewSlider: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!

	@IBOutlet var collectionViewProducts: UICollectionView!
	@IBOutlet var layoutConstraintProductsHeight: NSLayoutConstraint!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		collectionViewSlider.register(UINib(nibName: "Home1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Home1Cell1")
		collectionViewProducts.register(UINib(nibName: "Home1Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Home1Cell2")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillLayoutSubviews() {

		super.viewWillLayoutSubviews()

		layoutConstraintProductsHeight.constant = collectionViewProducts.contentSize.height
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Shop"
		labelSubTitle.text = "Over 45K Items Available for you"
		imageProfile.sample("Social", "Portraits", 1)
		pageControl.numberOfPages = 5

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["images"] = "Electronics"
		dict1["title"] = "New Trend"
		dict1["description"] = "Dress like a tourist"
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["images"] = "Clothes"
		dict2["title"] = "Shirts"
		dict2["description"] = "Fresh prints of Bel-Air"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["images"] = "Shoes"
		dict3["title"] = "Shoes"
		dict3["description"] = "Bring power to your steps"
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["images"] = "Watches"
		dict4["title"] = "Watches"
		dict4["description"] = "Time is what you make of it."
		products.append(dict4)

		var dict5: [String: String] = [:]
		dict5["images"] = "Clothes"
		dict5["title"] = "Jeans"
		dict5["description"] = "Quality never goes out of style"
		products.append(dict5)

		var dict6: [String: String] = [:]
		dict6["images"] = "Clothes"
		dict6["title"] = "T-Shirts"
		dict6["description"] = "Blink If You Want Me"
		products.append(dict6)

		refreshCollectionViewSlider()
		refreshCollectionViewProducts()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewSlider() {

		collectionViewSlider.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewProducts() {

		collectionViewProducts.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionViewSlider)		{ return 5 }
		if (collectionView == collectionViewProducts)	{ return products.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewSlider) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell1", for: indexPath) as! Home1Cell1
			cell.bindData(index: indexPath.item)
			return cell
		}

		if (collectionView == collectionViewProducts) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell2", for: indexPath) as! Home1Cell2
			cell.bindData(index: indexPath.item, data: products[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		if (collectionView == collectionViewSlider) {

		}
		if (collectionView == collectionViewProducts) {

		}
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		if (collectionView == collectionViewSlider) {
			return collectionView.frame.size
		}
		if (collectionView == collectionViewProducts) {
			let width = (collectionView.frame.size.width-15)/2
			return CGSize(width: width, height: width)
		}

		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewSlider)		{ return 0 }
		if (collectionView == collectionViewProducts)	{ return 15 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewSlider)		{ return 0 }
		if (collectionView == collectionViewProducts)	{ return 15 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionViewSlider)		{ return UIEdgeInsets.zero }
		if (collectionView == collectionViewProducts)	{ return UIEdgeInsets.zero }

		return UIEdgeInsets.zero
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		let visibleRect = CGRect(origin: collectionViewSlider.contentOffset, size: collectionViewSlider.bounds.size)
		let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

		if let visibleIndexPath = collectionViewSlider.indexPathForItem(at: visiblePoint) {
			pageControl.currentPage = visibleIndexPath.row
		}
	}
}
