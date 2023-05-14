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
class Artist2View: UIViewController {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelFollowers: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var buttonReadMore: UIButton!
	@IBOutlet var labelSongs: UILabel!
	@IBOutlet var labelAlbums: UILabel!
	@IBOutlet var collectionView1: UICollectionView!
	@IBOutlet var constraintCollectionView1Height: NSLayoutConstraint!
	@IBOutlet var collectionView2: UICollectionView!

	private var songs: [[String: Any]] = []
	private var albums: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore)), UIBarButtonItem(image: UIImage(systemName: "text.badge.plus"), style: .done, target: self, action: #selector(actionAddToPlaylist))]

		collectionView1.register(UINib(nibName: "Artist2Cell1", bundle: nil), forCellWithReuseIdentifier: "Artist2Cell1")
		collectionView2.register(UINib(nibName: "Artist2Cell2", bundle: nil), forCellWithReuseIdentifier: "Artist2Cell2")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintCollectionView1Height.constant = collectionView1.contentSize.height
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewProfile.sample("Media", "Bands", 21)
		labelName.text = "Calvin Harris"
		labelFollowers.text = "3.4M followers"
		labelDescription.text = "Born in Syracuse, New York and raised in Grapevine, Texas, Malone rose to fame in the mid-2010s following Born in Syracuse, New York and raised in Grapevine, Texas, Malone rose to fame in the mid-2010s following"
		labelSongs.text = "43"
		labelAlbums.text = "4"

		songs.removeAll()
		albums.removeAll()

		var dict1: [String: Any] = [:]
		dict1["name"] = "Summer"
		dict1["artist"] = "Motion"
		dict1["isBookmark"] = false
		dict1["isDownload"] = false
		songs.append(dict1)

		var dict2: [String: Any] = [:]
		dict2["name"] = "Rollin"
		dict2["artist"] = "Funk Wav Bounces Vol. 1"
		dict2["isBookmark"] = true
		dict2["isDownload"] = false
		songs.append(dict2)

		var dict3: [String: Any] = [:]
		dict3["name"] = "Sweet Nothing"
		dict3["artist"] = "18 Months"
		dict3["isBookmark"] = true
		dict3["isDownload"] = true
		songs.append(dict3)

		var dict4: [String: Any] = [:]
		dict4["name"] = "Better Now"
		dict4["artist"] = "Post Malone"
		dict4["isBookmark"] = false
		dict4["isDownload"] = false
		songs.append(dict4)

		var dict5: [String: Any] = [:]
		dict5["name"] = "Lucky You"
		dict5["artist"] = "Eminem feat. Joyner Lucas"
		dict5["isBookmark"] = true
		dict5["isDownload"] = false
		songs.append(dict5)

		var dict6: [String: Any] = [:]
		dict6["name"] = "beerbongs & bentleys"
		dict6["artist"] = "Post Malone"
		dict6["isBookmark"] = true
		dict6["isDownload"] = true
		songs.append(dict6)

		var dict7: [String: Any] = [:]
		dict7["name"] = "Queen"
		dict7["artist"] = "Nicki Minaj"
		dict7["isBookmark"] = false
		dict7["isDownload"] = false
		songs.append(dict7)

		var dict8: [String: Any] = [:]
		dict8["name"] = "Life Is Good"
		dict8["artist"] = "Future Featuring Drake"
		dict8["isBookmark"] = true
		dict8["isDownload"] = false
		songs.append(dict8)

		var dict9: [String: String] = [:]
		dict9["song"] = "Freedom"
		dict9["artist"] = "Akon"
		albums.append(dict9)

		var dict10: [String: String] = [:]
		dict10["song"] = "No Roots - EP"
		dict10["artist"] = "Alice Merton"
		albums.append(dict10)

		var dict11: [String: String] = [:]
		dict11["song"] = "Funk Wav Bounces"
		dict11["artist"] = "Calvin Harris"
		albums.append(dict11)

		var dict12: [String: String] = [:]
		dict12["song"] = "A Head Full of Dreams"
		dict12["artist"] = "Coldplay"
		albums.append(dict12)

		albums.append(dict9)
		albums.append(dict10)

		refreshCollectionView1()
		refreshCollectionView2()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAddToPlaylist() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPlay(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReadMore(_ sender: Any) {

		if labelDescription.numberOfLines == 0 {
			labelDescription.numberOfLines = 3
			buttonReadMore.setTitle("Read More", for: .normal)
		}
		else {
			labelDescription.numberOfLines = 0
			buttonReadMore.setTitle("Read less", for: .normal)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllSongs(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllAlbums(_ sender: Any) {

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
extension Artist2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionView1) { return songs.count }
		if (collectionView == collectionView2) { return albums.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionView1) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Artist2Cell1", for: indexPath) as! Artist2Cell1
			cell.bindData(data: songs[indexPath.row])
			return cell
		}
		if (collectionView == collectionView2) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Artist2Cell2", for: indexPath) as! Artist2Cell2
			cell.bindData(index: indexPath.item + 3, data: albums[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Artist2View: UICollectionViewDelegate {

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
extension Artist2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let screenRect: CGRect = UIScreen.main.bounds
		let screenWidth: CGFloat = screenRect.size.width
		let height = collectionView.frame.size.height

		return CGSize(width: (screenWidth - 40)/2.3, height: height)
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
