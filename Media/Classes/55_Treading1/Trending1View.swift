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
class Trending1View: UIViewController {

	@IBOutlet var viewHeader: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var segmentControl: UISegmentedControl!
	@IBOutlet var collectionView1: UICollectionView!
	@IBOutlet var collectionView2: UICollectionView!
	@IBOutlet var constraintCollectionView2Height: NSLayoutConstraint!

	private var navigationBackgroundImage: UIImage?
	private var albums: [[String: Any]] = []
	private var songs: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: AppColor.Theme], for: .normal)

		collectionView1.register(UINib(nibName: "Trending1Cell1", bundle: nil), forCellWithReuseIdentifier: "Trending1Cell1")
		collectionView2.register(UINib(nibName: "Trending1Cell2", bundle: nil), forCellWithReuseIdentifier: "Trending1Cell2")

		updateUI()
		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintCollectionView2Height.constant = collectionView2.contentSize.height
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		songs.removeAll()
		albums.removeAll()

		var dict1: [String: Any] = [:]
		dict1["ratings"] = "4.9"
		dict1["type"] = "HIT"
		dict1["name"] = "Sweetener"
		dict1["artist"] = "Ariana Grande"
		dict1["isBookmark"] = false
		dict1["isDownload"] = false
		albums.append(dict1)

		var dict2: [String: Any] = [:]
		dict2["ratings"] = "4.9"
		dict2["type"] = "NEW ALBUM"
		dict2["name"] = "Scorpion"
		dict2["artist"] = "Drake"
		dict2["isBookmark"] = true
		dict2["isDownload"] = false
		albums.append(dict2)

		var dict3: [String: Any] = [:]
		dict3["ratings"] = "4.9"
		dict3["type"] = "HIT"
		dict3["name"] = "Sweet Nothing"
		dict3["artist"] = "18 Months"
		dict3["isBookmark"] = true
		dict3["isDownload"] = true
		albums.append(dict3)

		var dict4: [String: Any] = [:]
		dict4["ratings"] = "4.9"
		dict4["type"] = "NEW ALBUM"
		dict4["name"] = "Better Now"
		dict4["artist"] = "Post Malone"
		dict4["isBookmark"] = false
		dict4["isDownload"] = false
		albums.append(dict4)

		var dict5: [String: Any] = [:]
		dict5["ratings"] = "4.9"
		dict5["type"] = "HIT"
		dict5["name"] = "Lucky You"
		dict5["artist"] = "Eminem feat. Joyner Lucas"
		dict5["isBookmark"] = true
		dict5["isDownload"] = false
		albums.append(dict5)

		var dict6: [String: Any] = [:]
		dict6["ratings"] = "4.9"
		dict6["type"] = "NEW ALBUM"
		dict6["name"] = "beerbongs & bentleys"
		dict6["artist"] = "Post Malone"
		dict6["isBookmark"] = true
		dict6["isDownload"] = true
		albums.append(dict6)

		var dict7: [String: Any] = [:]
		dict7["ratings"] = "4.9"
		dict7["type"] = "HIT"
		dict7["name"] = "Queen"
		dict7["artist"] = "Nicki Minaj"
		dict7["isBookmark"] = false
		dict7["isDownload"] = false
		albums.append(dict7)

		var dict8: [String: Any] = [:]
		dict8["ratings"] = "4.9"
		dict8["type"] = "NEW ALBUM"
		dict8["name"] = "Life Is Good"
		dict8["artist"] = "Future Featuring Drake"
		dict8["isBookmark"] = true
		dict8["isDownload"] = false
		albums.append(dict8)

		var dict9: [String: Any] = [:]
		dict9["name"] = "Summer"
		dict9["artist"] = "Motion"
		dict9["isBookmark"] = false
		dict9["isDownload"] = false
		songs.append(dict9)

		var dict10: [String: Any] = [:]
		dict10["name"] = "Rollin"
		dict10["artist"] = "Funk Wav Bounces Vol. 1"
		dict10["isBookmark"] = true
		dict10["isDownload"] = false
		songs.append(dict10)

		var dict11: [String: Any] = [:]
		dict11["name"] = "Sweet Nothing"
		dict11["artist"] = "18 Months"
		dict11["isBookmark"] = true
		dict11["isDownload"] = true
		songs.append(dict11)

		var dict12: [String: Any] = [:]
		dict12["name"] = "Better Now"
		dict12["artist"] = "Post Malone"
		dict12["isBookmark"] = false
		dict12["isDownload"] = false
		songs.append(dict12)

		var dict13: [String: Any] = [:]
		dict13["name"] = "Lucky You"
		dict13["artist"] = "Eminem feat. Joyner Lucas"
		dict13["isBookmark"] = true
		dict13["isDownload"] = false
		songs.append(dict13)

		var dict14: [String: Any] = [:]
		dict14["name"] = "beerbongs & bentleys"
		dict14["artist"] = "Post Malone"
		dict14["isBookmark"] = true
		dict14["isDownload"] = true
		songs.append(dict14)

		var dict15: [String: Any] = [:]
		dict15["name"] = "Queen"
		dict15["artist"] = "Nicki Minaj"
		dict15["isBookmark"] = false
		dict15["isDownload"] = false
		songs.append(dict15)

		var dict16: [String: Any] = [:]
		dict16["name"] = "Life Is Good"
		dict16["artist"] = "Future Featuring Drake"
		dict16["isBookmark"] = true
		dict16["isDownload"] = false
		songs.append(dict16)

		refreshCollectionView1()
		refreshCollectionView2()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		let background = UIColor.systemBackground.image(segmentControl.frame.size)
		let selected = AppColor.Theme.image(segmentControl.frame.size)

		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
		segmentControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
		segmentControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
		segmentControl.setDividerImage(AppColor.Theme.image(), forLeftSegmentState: .normal, rightSegmentState: [.normal, .highlighted, .selected], barMetrics: .default)
		segmentControl.layer.borderWidth = 1
		segmentControl.layer.borderColor = AppColor.Theme.cgColor
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSegment(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllSongs(_ sender: Any) {

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

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Trending1View: UIScrollViewDelegate {

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
extension Trending1View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionView1) { return albums.count }
		if (collectionView == collectionView2) { return songs.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionView1) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Trending1Cell1", for: indexPath) as! Trending1Cell1
			cell.bindData(index: indexPath.item, data: albums[indexPath.row])
			return cell
		}
		if (collectionView == collectionView2) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Trending1Cell2", for: indexPath) as! Trending1Cell2
			cell.bindData(data: songs[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Trending1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if (collectionView == collectionView1) {
		}
		if (collectionView == collectionView2) {
		}
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Trending1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let screenRect: CGRect = UIScreen.main.bounds
		let screenWidth: CGFloat = screenRect.size.width
		let height = collectionView.frame.size.height

		return CGSize(width: (screenWidth - 40)/1.2, height: height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
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

// MARK: - UIColor
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension UIColor {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

		return UIGraphicsImageRenderer(size: size).image { rendererContext in
			setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}
