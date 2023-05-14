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
class AlbumView: UIViewController {

	@IBOutlet var imageViewLogo: UIImageView!
	@IBOutlet var labelArtist: UILabel!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelGenre: UILabel!
	@IBOutlet var labelTotalSong: UILabel!
	@IBOutlet var labelRating: UILabel!
	@IBOutlet var labelReviews: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var buttonReadMore: UIButton!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableViewHeight: NSLayoutConstraint!

	private var songs: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Album"

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore))

		tableView.register(UINib(nibName: "AlbumCell", bundle: nil), forCellReuseIdentifier: "AlbumCell")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintTableViewHeight.constant = tableView.contentSize.height
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewLogo.sample("Media", "Music", 19)
		labelArtist.text = "Eminem · 2018"
		labelTitle.text = "Kamikaze"
		labelGenre.text = "Rap/Hip-Hop"
		labelTotalSong.text = "13 songs · 45 min"
		labelRating.text = "4.9"
		labelReviews.text = "37 reviews"
		labelDescription.text = "The album features guest appearances from Joyner Lucas, Royce da 5'9, Jessie Reyez, and uncredited vocals by Justin Vernon. Eminem, credited as Slim Shady, and Dr. Dre served as executive…"

		songs.removeAll()

		var dict1: [String: Any] = [:]
		dict1["name"] = "The Ringer"
		dict1["duration"] = "3:38"
		dict1["isExplicit"] = false
		songs.append(dict1)

		var dict2: [String: Any] = [:]
		dict2["name"] = "Greatest"
		dict2["duration"] = "2:38"
		dict2["isExplicit"] = true
		songs.append(dict2)

		var dict3: [String: Any] = [:]
		dict3["name"] = "Lucky You (feat. Joyner Lucas)"
		dict3["duration"] = "3:38"
		dict3["isExplicit"] = false
		songs.append(dict3)

		var dict4: [String: Any] = [:]
		dict4["name"] = "Paul (Skit)"
		dict4["duration"] = "2:38"
		dict4["isExplicit"] = false
		songs.append(dict4)

		var dict5: [String: Any] = [:]
		dict5["name"] = "Em Calls Paul (Skit)"
		dict5["duration"] = "3:38"
		dict5["isExplicit"] = false
		songs.append(dict5)

		var dict6: [String: Any] = [:]
		dict6["name"] = "The Box"
		dict6["duration"] = "2:38"
		dict6["isExplicit"] = false
		songs.append(dict6)

		var dict7: [String: Any] = [:]
		dict7["name"] = "Don't Start Now"
		dict7["duration"] = "3:38"
		dict7["isExplicit"] = false
		songs.append(dict7)

		var dict8: [String: Any] = [:]
		dict8["name"] = "Life Is Good"
		dict8["duration"] = "2:38"
		dict8["isExplicit"] = false
		songs.append(dict8)

		var dict9: [String: Any] = [:]
		dict9["name"] = "Blinding Lights"
		dict9["duration"] = "3:38"
		dict9["isExplicit"] = false
		songs.append(dict9)

		var dict10: [String: Any] = [:]
		dict10["name"] = "Circles"
		dict10["duration"] = "2:38"
		dict10["isExplicit"] = false
		songs.append(dict10)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReviews(_ sender: Any) {

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
	@IBAction func actionSubscribe(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionShuffle(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPlay(_ sender: Any) {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AlbumView: UITableViewDataSource {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
		cell.bindData(data: songs[indexPath.row], index: indexPath.row + 1)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AlbumView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
