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
class Artist1View: UIViewController {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var buttonGenre: UIButton!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSongsAlbums: UILabel!
	@IBOutlet var labelFollowers: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var buttonReadMore: UIButton!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var constraintCollectionViewHeight: NSLayoutConstraint!

	private var navigationBackgroundImage: UIImage?
	private var songs: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore))

		collectionView.register(UINib(nibName: "Artist1Cell", bundle: nil), forCellWithReuseIdentifier: "Artist1Cell")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintCollectionViewHeight.constant = collectionView.contentSize.height
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewProfile.sample("Media", "Bands", 4)
		buttonGenre.setTitle("Pop Rock", for: .normal)
		labelTitle.text = "Imagine Dragons"
		labelSongsAlbums.text = "139 songs · 248 albums"
		labelFollowers.text = "3.4M followers"
		labelDescription.text = "Imagine Dragons is an American pop rock band from Las Vegas, Nevada, consisting of lead vocalist Dan Reynolds, lead guitarist Wayne Sermon, bassist Ben McKee"

		songs.removeAll()

		var dict1: [String: Any] = [:]
		dict1["name"] = "In My Feelings"
		dict1["artist"] = "Drake"
		dict1["isBookmark"] = false
		dict1["isDownload"] = false
		songs.append(dict1)

		var dict2: [String: Any] = [:]
		dict2["name"] = "Girls Like You"
		dict2["artist"] = "Maroon 5 feat. Cardi B"
		dict2["isBookmark"] = true
		dict2["isDownload"] = false
		songs.append(dict2)

		var dict3: [String: Any] = [:]
		dict3["name"] = "I Like It"
		dict3["artist"] = "Cardi B, Bad Bunny & J Balvin"
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

		var dict9: [String: Any] = [:]
		dict9["name"] = "Blinding Lights"
		dict9["artist"] = "The Weeknd"
		dict9["isBookmark"] = true
		dict9["isDownload"] = true
		songs.append(dict9)

		var dict10: [String: Any] = [:]
		dict10["name"] = "Circles"
		dict10["artist"] = "Post Malone"
		dict10["isBookmark"] = false
		dict10["isDownload"] = false
		songs.append(dict10)

		refreshCollectionView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPlay(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFollow(_ sender: Any) {

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
	@IBAction func actionSeeAll(_ sender: Any) {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}
}

// MARK:- UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Artist1View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return songs.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Artist1Cell", for: indexPath) as! Artist1Cell
		cell.bindData(data: songs[indexPath.row])
		return cell
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Artist1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
