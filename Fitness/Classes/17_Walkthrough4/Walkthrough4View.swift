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
class Walkthrough4View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!

	private var collections: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		collectionView.register(UINib(nibName: "Walkthrough4Cell", bundle: nil), forCellWithReuseIdentifier: "Walkthrough4Cell")

		pageControl.pageIndicatorTintColor = UIColor.lightGray
		pageControl.currentPageIndicatorTintColor = AppColor.Theme

		loadCollections()
	}

	// MARK: - Collections methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadCollections() {

		collections.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Environmental"
		dict1["description"] = "A healthy physical environment free of hazards; awareness of the role we play in bettering rather than denigrating the natural environment"
		collections.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Spiritual"
		dict2["description"] = "Our search for meaning and purpose in human existence"
		collections.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Physical"
		dict3["description"] = "A healthy body through exercise, nutrition, sleep, etc."
		collections.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Emotional"
		dict4["description"] = "Being in touch with, aware of, accepting of, and able to express one’s feelings (and those of others)."
		collections.append(dict4)

		refreshCollectionView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSkip(_ sender: UIButton) {

		dismiss(animated: true)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}
}

// MARK:- UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Walkthrough4View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return collections.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Walkthrough4Cell", for: indexPath) as! Walkthrough4Cell
		cell.bindData(index: indexPath.item, data: collections[indexPath.row])
		return cell
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Walkthrough4View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

		pageControl.currentPage = indexPath.row
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Walkthrough4View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let height = collectionView.frame.size.height
		let width = collectionView.frame.size.width

		return CGSize(width: width, height: height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}
}
