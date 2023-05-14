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
class SongsView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var songs: [[String: String]] = []
	private var songsDictionary: [String: [[String: String]]] = [:]
	private var songsSectionTitles: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Songs"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: setupSortByButton())

		tableView.register(UINib(nibName: "SongsCell", bundle: nil), forCellReuseIdentifier: "SongsCell")

		tableView.tableHeaderView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: tableView.frame.size.width, height: 60)))
		let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
		label.text = "414 songs"
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 15.0)
		label.textColor = UIColor.secondaryLabel
		tableView.tableFooterView = label

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .automatic
	}

	// MARK: - Navigation methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setupSortByButton() -> UIButton {

		let imageAttachment = NSTextAttachment()
		imageAttachment.image = UIImage(systemName: "arrow.up.arrow.down")?.withTintColor(AppColor.Theme)
		imageAttachment.bounds = CGRect(x: 0, y: -3, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)

		let attachmentString = NSAttributedString(attachment: imageAttachment)
		let completeText = NSMutableAttributedString(string: "Sort by")
		let spaceText = NSMutableAttributedString(string: " ")
		completeText.append(spaceText)

		completeText.append(attachmentString)
		completeText.addAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], range: NSRange(location: 0, length: 7))

		let button = UIButton()
		button.setAttributedTitle(completeText, for: .normal)
		button.addTarget(self, action: #selector(actionSortBy), for: .touchUpInside)
		return button
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		songs.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Hello"
		dict1["artist"] = "Adele"
		songs.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Amor Gitana"
		dict2["artist"] = "Akcent"
		songs.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Yesterday"
		dict3["artist"] = "The Beatles"
		songs.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Rollin (feat. Future)"
		dict4["artist"] = "Calvin Harris"
		songs.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Adventure of a Lifetime"
		dict5["artist"] = "Coldplay"
		songs.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "The Box"
		dict6["artist"] = "Roddy Ricch"
		songs.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Don't Start Now"
		dict7["artist"] = "Dua Lipa"
		songs.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Life Is Good"
		dict8["artist"] = "Future Featuring Drake"
		songs.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Blinding Lights"
		dict9["artist"] = "The Weeknd"
		songs.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "Circles"
		dict10["artist"] = "Post Malone"
		songs.append(dict10)

		for song in songs {
			let name = String((song["artist"]?.prefix(1))!)
			if var songValues = songsDictionary[name] {
				songValues.append(song)
				songsDictionary[name] = songValues
			} else {
				songsDictionary[name] = [song]
			}
		}

		songsSectionTitles = [String](songsDictionary.keys)
		songsSectionTitles = songsSectionTitles.sorted(by: { $0 < $1 })

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSortBy() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPlay(_ sender: Any) {

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

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SongsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return songsSectionTitles.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func sectionIndexTitles(for tableView: UITableView) -> [String]? {

		return songsSectionTitles
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return songsSectionTitles[section]
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		let songKey = songsSectionTitles[section]
		if let songsValues = songsDictionary[songKey] {
			return songsValues.count
		}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "SongsCell", for: indexPath) as! SongsCell
		let song = songsDictionary[songsSectionTitles[indexPath.section]]![indexPath.row]
		cell.bindData(data: song)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SongsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
