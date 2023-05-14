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
class Trending2View: UIViewController {

	@IBOutlet var viewHeader: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var collectionView1: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!
	@IBOutlet var collectionView2: UICollectionView!
	@IBOutlet var collectionView3: UICollectionView!
	@IBOutlet var constraintCollectionView3Height: NSLayoutConstraint!

	private var navigationBackgroundImage: UIImage?
	private var collections: [[String: String]] = []
	private var albums: [[String: String]] = []
	private var genres = ["Pop", "Classical", "Rock", "Blues", "Jazz", "Dance"]

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		collectionView1.register(UINib(nibName: "Trending2Cell1", bundle: nil), forCellWithReuseIdentifier: "Trending2Cell1")
		collectionView2.register(UINib(nibName: "Trending2Cell2", bundle: nil), forCellWithReuseIdentifier: "Trending2Cell2")
		collectionView3.register(UINib(nibName: "Trending2Cell3", bundle: nil), forCellWithReuseIdentifier: "Trending2Cell3")

		pageControl.pageIndicatorTintColor = UIColor.lightGray
		pageControl.currentPageIndicatorTintColor = AppColor.Theme

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintCollectionView3Height.constant = collectionView3.contentSize.height
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		collections.removeAll()
		albums.removeAll()

		var dict1: [String: String] = [:]
		dict1["type"] = "Popular"
		dict1["title"] = "Best of the Week"
		dict1["songs"] = "89 popular songs"
		collections.append(dict1)

		var dict2: [String: String] = [:]
		dict2["type"] = "Popular"
		dict2["title"] = "Best of the Week"
		dict2["songs"] = "89 popular songs"
		collections.append(dict2)

		var dict3: [String: String] = [:]
		dict3["type"] = "Popular"
		dict3["title"] = "Best of the Week"
		dict3["songs"] = "89 popular songs"
		collections.append(dict3)

		var dict4: [String: String] = [:]
		dict4["type"] = "Popular"
		dict4["title"] = "Best of the Week"
		dict4["songs"] = "89 popular songs"
		collections.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Kamikaze"
		dict5["artist"] = "Eminem"
		albums.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "ASTROWORLD"
		dict6["artist"] = "Travis Scott"
		albums.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Scorpion"
		dict7["artist"] = "Drake"
		albums.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "A Head Full of Dreams"
		dict8["artist"] = "Coldplay"
		albums.append(dict8)

		refreshCollectionView1()
		refreshCollectionView2()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllAlbums(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllGenres(_ sender: Any) {

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

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView3() {

		collectionView3.reloadData()
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Trending2View: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.contentOffset.y > viewHeader.frame.origin.y {
			navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
			title = labelTitle.text
		}
		else {
			navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
			title = ""
		}
	}
}

// MARK:- UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Trending2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionView1) { return collections.count }
		if (collectionView == collectionView2) { return albums.count }
		if (collectionView == collectionView3) { return genres.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionView1) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Trending2Cell1", for: indexPath) as! Trending2Cell1
			cell.bindData(index: indexPath.item, data: collections[indexPath.row])
			return cell
		}
		if (collectionView == collectionView2) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Trending2Cell2", for: indexPath) as! Trending2Cell2
			cell.bindData(index: indexPath.item, data: albums[indexPath.row])
			return cell
		}
		if (collectionView == collectionView3) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Trending2Cell3", for: indexPath) as! Trending2Cell3
			cell.bindData(title: genres[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Trending2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if (collectionView == collectionView1) {
		}
		if (collectionView == collectionView2) {
		}
		if (collectionView == collectionView3) {
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

		if collectionView == collectionView1 {
			pageControl.currentPage = indexPath.row
		}
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Trending2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let screenRect: CGRect = UIScreen.main.bounds
		let screenWidth: CGFloat = screenRect.size.width
		let height = collectionView.frame.size.height

		if collectionView == collectionView1 {
			return CGSize(width: screenWidth, height: height)
		}
		if collectionView == collectionView2 {
			return CGSize(width: (screenWidth - 40)/2.3, height: height)
		}
		if collectionView == collectionView3 {
			return CGSize(width: (screenWidth - 40)/2, height: 44)
		}
		return CGSize(width: 0, height: 0)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if collectionView == collectionView1 {
			return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		}
		if collectionView == collectionView2 {
			return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		}
		if collectionView == collectionView3 {
			return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		}
		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if collectionView == collectionView1 {
			return 0
		}
		if collectionView == collectionView2 {
			return 10
		}
		if collectionView == collectionView3 {
			return 10
		}
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if collectionView == collectionView1 {
			return 0
		}
		if collectionView == collectionView2 {
			return 10
		}
		if collectionView == collectionView3 {
			return 10
		}
		return 0
	}
}
