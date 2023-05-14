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
class ArtistsView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var searchController: UISearchController!
	private var artists: [[String: String]] = []
	private var artistsDictionary: [String: [[String: String]]] = [:]
	private var artistsSectionTitles: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Artists"

		searchController = UISearchController()
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always
		navigationItem.searchController = searchController

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: setupSortByButton())

		tableView.register(UINib(nibName: "ArtistsCell", bundle: nil), forCellReuseIdentifier: "ArtistsCell")

		let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
		label.text = "82 artists"
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

		artists.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Abba"
		dict1["songs"] = "16 songs"
		artists.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Adele"
		dict2["songs"] = "31 songs"
		artists.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Bahroma"
		dict3["songs"] = "4 songs"
		artists.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "The Beatles"
		dict4["songs"] = "12 songs"
		artists.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Burito"
		dict5["songs"] = "46 songs"
		artists.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Calvin Harris"
		dict6["songs"] = "4 songs"
		artists.append(dict6)

		for artist in artists {
			let name = String((artist["name"]?.prefix(1))!)
			if var artistValues = artistsDictionary[name] {
				artistValues.append(artist)
				artistsDictionary[name] = artistValues
			} else {
				artistsDictionary[name] = [artist]
			}
		}

		artistsSectionTitles = [String](artistsDictionary.keys)
		artistsSectionTitles = artistsSectionTitles.sorted(by: { $0 < $1 })

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSortBy() {

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
extension ArtistsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return artistsSectionTitles.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func sectionIndexTitles(for tableView: UITableView) -> [String]? {

		return artistsSectionTitles
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return artistsSectionTitles[section]
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		let artistKey = artistsSectionTitles[section]
		if let artistsValues = artistsDictionary[artistKey] {
			return artistsValues.count
		}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistsCell", for: indexPath) as! ArtistsCell
		let artist = artistsDictionary[artistsSectionTitles[indexPath.section]]![indexPath.row]
		cell.bindData(index: indexPath.item + (indexPath.section + indexPath.section), data: artist)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ArtistsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
