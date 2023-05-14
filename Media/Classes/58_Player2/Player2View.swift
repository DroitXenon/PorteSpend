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
class Player2View: UIViewController {

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelArtist: UILabel!
	@IBOutlet var progressView: UIProgressView!
	@IBOutlet var labelElapsedTime: UILabel!
	@IBOutlet var labelTotalDuration: UILabel!
	@IBOutlet var buttonRepeat: UIButton!
	@IBOutlet var buttonPrevious: UIButton!
	@IBOutlet var buttonPlay: UIButton!
	@IBOutlet var buttonNext: UIButton!
	@IBOutlet var buttonShuffle: UIButton!
	@IBOutlet var sliderVolume: UISlider!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableViewHeight: NSLayoutConstraint!

	private var navigationBackgroundImage: UIImage?
	private var songs: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .done, target: self, action: #selector(actionMinimize))
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore))

		tableView.register(UINib(nibName: "Player2Cell", bundle: nil), forCellReuseIdentifier: "Player2Cell")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintTableViewHeight.constant = tableView.contentSize.height
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageView.sample("Media", "Music", 16)
		labelTitle.text = "Summer"
		labelArtist.text = "Calvin Harris"
		progressView.progress = 0.5
		labelElapsedTime.text = "01:03"
		labelTotalDuration.text = "02:44"
		sliderVolume.value = 0.4

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

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMinimize() {

		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionRepeat(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPrevious(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPlay(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionNext(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionShuffle(_ sender: Any) {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Player2View: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.contentOffset.y > labelTitle.frame.origin.y {
			navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
			title = labelTitle.text
		}
		else {
			navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
			title = ""
		}
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Player2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return songs.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Player2Cell", for: indexPath) as! Player2Cell
		cell.bindData(data: songs[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Player2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
