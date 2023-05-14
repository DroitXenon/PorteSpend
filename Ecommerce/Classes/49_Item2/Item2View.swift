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
class Item2View: UIViewController {

	@IBOutlet var collectionViewSlider: UICollectionView!

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelBrandName: UILabel!
	@IBOutlet var labelPrice: UILabel!
	@IBOutlet var labelOriginalPrice: UILabel!

	@IBOutlet var viewColor1: UIView!
	@IBOutlet var viewColor2: UIView!
	@IBOutlet var viewColor3: UIView!

	@IBOutlet var labelSize1: UILabel!
	@IBOutlet var labelSize2: UILabel!
	@IBOutlet var labelSize3: UILabel!

	@IBOutlet var buttonColor: UIButton!
	@IBOutlet var buttonSize: UIButton!

	@IBOutlet var labelDescription: UILabel!

	@IBOutlet var buttonWishlist: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		let buttonAddList = UIBarButtonItem(image: UIImage(systemName: "text.badge.plus"), style: .plain, target: self, action: #selector(actionAddList))
		let buttonShare = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare))
		navigationItem.rightBarButtonItems = [buttonShare, buttonAddList]

		buttonWishlist.layer.borderWidth = 1
		buttonColor.layer.borderWidth = 1
		buttonSize.layer.borderWidth = 1
		viewColor1.layer.borderWidth = 1
		viewColor2.layer.borderWidth = 1
		viewColor3.layer.borderWidth = 1

		buttonWishlist.layer.borderColor = AppColor.Border.cgColor
		buttonColor.layer.borderColor = AppColor.Border.cgColor
		buttonSize.layer.borderColor = AppColor.Border.cgColor
		viewColor1.layer.borderColor = AppColor.Border.cgColor
		viewColor2.layer.borderColor = AppColor.Border.cgColor
		viewColor3.layer.borderColor = AppColor.Border.cgColor

		collectionViewSlider.register(UINib(nibName: "Item2Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Item2Cell1")

		let cellWidth = UIScreen.main.bounds.width - 60
		let sectionSpacing = CGFloat(30)
		let cellSpacing = CGFloat(10)

		if let layout = collectionViewSlider.collectionViewLayout as? Item2PagingCollectionViewLayout {
			layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
			layout.itemSize = CGSize(width: cellWidth, height: collectionViewSlider.frame.size.height)
			layout.minimumLineSpacing = cellSpacing
			collectionViewSlider.collectionViewLayout = layout
			collectionViewSlider.translatesAutoresizingMaskIntoConstraints = false
			collectionViewSlider.decelerationRate = .fast
		}

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Platform Derby Fashion"
		labelBrandName.text = "Stella McCartney"
		labelPrice.text = "$384.00"
		labelOriginalPrice.text = "$640.00"
		labelOriginalPrice.isHidden = false
		labelDescription.text = "Reviving and replicating footwear legends, Clarks Originals laid-back shoes and boots look to authenticity and individuality. Desert boots, wallabee shoes and hiking boots take on Clarks Originals' signature crepe soles, whilst their uppers get updated in with tweeds, prints and washed-out colours."
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAddList(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionColorBlack(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionColorWhite(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionColorGray(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionColor(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSize8(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSize9(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSize10(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSize(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionWishlist(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddCart(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Item2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionViewSlider) { return 10 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewSlider) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item2Cell1", for: indexPath) as! Item2Cell1
			cell.bindData(index: indexPath.item)
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Item2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		if (collectionView == collectionViewSlider) { }
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Item2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width
		let height = collectionView.frame.size.height

		if (collectionView == collectionViewSlider) { return CGSize(width: width-60, height: height) }

		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewSlider) { return 10 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewSlider) { return 10 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionViewSlider) { return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30) }

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}
