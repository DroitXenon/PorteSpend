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
class PlaylistView: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelGenre: UILabel!
	@IBOutlet var labelTotalSong: UILabel!
	@IBOutlet var imageViewLogo: UIImageView!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableViewHeight: NSLayoutConstraint!

	private var songs: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Playlist"

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore))

		tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: "PlaylistCell")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintTableViewHeight.constant = tableView.contentSize.height
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Electronic Hits\nof 2018"
		labelGenre.text = "Electronic"
		labelTotalSong.text = "94 songs · 34 min"
		imageViewLogo.sample("Media", "Bands", 4)

		songs.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Hello"
		dict1["artist"] = "Adele"
		dict1["duration"] = "3:38"
		songs.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Amor Gitana"
		dict2["artist"] = "Akcent"
		dict2["duration"] = "2:38"
		songs.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Yesterday"
		dict3["artist"] = "The Beatles"
		dict3["duration"] = "3:38"
		songs.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Rollin (feat. Future)"
		dict4["artist"] = "Calvin Harris"
		dict4["duration"] = "2:38"
		songs.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Adventure of a Lifetime"
		dict5["artist"] = "Coldplay"
		dict5["duration"] = "3:38"
		songs.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "The Box"
		dict6["artist"] = "Roddy Rich"
		dict6["duration"] = "2:38"
		songs.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Don't Start Now"
		dict7["artist"] = "Dua Lipa"
		dict7["duration"] = "3:38"
		songs.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Life Is Good"
		dict8["artist"] = "Future Featuring Drake"
		dict8["duration"] = "2:38"
		songs.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Blinding Lights"
		dict9["artist"] = "The Weeknd"
		dict9["duration"] = "3:38"
		songs.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "Circles"
		dict10["artist"] = "Post Malone"
		dict10["duration"] = "2:38"
		songs.append(dict10)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDownload(_ sender: Any) {

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
extension PlaylistView: UITableViewDataSource {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath) as! PlaylistCell
		cell.bindData(data: songs[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension PlaylistView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
