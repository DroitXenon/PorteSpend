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
class Item4View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!
	@IBOutlet var labelSale: UILabel!
	@IBOutlet var buttonFavorite: UIButton!

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelBrandName: UILabel!
	@IBOutlet var labelPrice: UILabel!
	@IBOutlet var labelOriginalPrice: UILabel!

	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelAboutBrand: UILabel!

	@IBOutlet var viewDescriptionOuter: UIView!
	@IBOutlet var viewAboutBrandOuter: UIView!

	@IBOutlet var viewDescriptionHeader: UIView!
	@IBOutlet var viewAboutBrandHeader: UIView!

	@IBOutlet var viewDescriptionDeails: UIView!
	@IBOutlet var viewAboutBrandDeails: UIView!

	@IBOutlet var imageDescription: UIImageView!
	@IBOutlet var imageAboutBrand: UIImageView!

	private var images = ["", "", "", "", "", ""]

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		let buttonAddList = UIBarButtonItem(image: UIImage(systemName: "text.badge.plus"), style: .plain, target: self, action: #selector(actionAddList))
		let buttonShare = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare))
		navigationItem.rightBarButtonItems = [buttonShare, buttonAddList]

		labelSale.layer.borderWidth = 1
		labelSale.layer.borderColor = AppColor.Border.cgColor

		buttonFavorite.layer.borderWidth = 1
		buttonFavorite.layer.borderColor = AppColor.Border.cgColor

		collectionView.register(UINib(nibName: "Item4Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Item4Cell1")
		pageControl.currentPage = 0
		pageControl.numberOfPages = images.count

		imageDescription.isHighlighted = true
		imageAboutBrand.isHighlighted = false
		updateUI()

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Platform Derby Shoes"
		labelBrandName.text = "Stella McCartney"
		labelPrice.text = "$384.00"
		labelOriginalPrice.text = "$640.00"
		labelOriginalPrice.isHidden = false
		labelSale.isHidden = false
		labelDescription.text = "For many of us who are city dwellers, we don’t really notice that sky up there on a routine basis. The lights of the city do a good job of disguising the amazing display that is above all of our heads all of the time. So it might be that once a year vacation to a camping spot or a trip to a relative’s house out in the country."
		labelAboutBrand.text = "Describe About Info\n\nAlessandro Michele who discovered it on posts on Instagram and in a tongue-in-cheek ode has introduced this new spelling."
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		viewDescriptionOuter.layer.cornerRadius = 10
		viewAboutBrandOuter.layer.cornerRadius = 10

		viewDescriptionOuter.layer.borderWidth = imageDescription.isHighlighted ? 1 : 0
		viewAboutBrandOuter.layer.borderWidth = imageAboutBrand.isHighlighted ? 1 : 0

		viewDescriptionOuter.layer.borderColor = AppColor.Border.cgColor
		viewAboutBrandOuter.layer.borderColor = AppColor.Border.cgColor

		viewDescriptionHeader.backgroundColor = !imageDescription.isHighlighted ? UIColor.tertiarySystemFill : UIColor.systemBackground
		viewAboutBrandHeader.backgroundColor = !imageAboutBrand.isHighlighted ? UIColor.tertiarySystemFill : UIColor.systemBackground

		viewDescriptionDeails.isHidden = !imageDescription.isHighlighted
		viewAboutBrandDeails.isHidden = !imageAboutBrand.isHighlighted
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAddList(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFavorite(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSize(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddCart(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDescription(_ sender: UIButton) {

		print(#function)
		imageDescription.isHighlighted = !imageDescription.isHighlighted
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAboutBrand(_ sender: UIButton) {

		print(#function)
		imageAboutBrand.isHighlighted = !imageAboutBrand.isHighlighted
		updateUI()
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Item4View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return images.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item4Cell1", for: indexPath) as! Item4Cell1
		cell.bindData(index: indexPath)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Item4View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Item4View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets.zero
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Item4View: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
		let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

		if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
			pageControl.currentPage = visibleIndexPath.row
		}
	}
}
