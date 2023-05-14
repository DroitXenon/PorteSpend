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
class PlaylistsView: UIViewController {

	@IBOutlet var viewHeader: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableViewHeight: NSLayoutConstraint!

	private var navigationBackgroundImage: UIImage?
	private var playlists: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: setupAddButton())

		tableView.register(UINib(nibName: "PlaylistsCell", bundle: nil), forCellReuseIdentifier: "PlaylistsCell")
		tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Tableview Observer
	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

		if let obj = object as? UITableView {
			if obj == tableView && keyPath == "contentSize" {
				if let newSize = change?[NSKeyValueChangeKey.newKey] as? CGSize {
					constraintTableViewHeight.constant = newSize.height
				}
			}
		}
	}

	// MARK: - Navigation methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setupAddButton() -> UIButton {

		let imageAttachment = NSTextAttachment()
		imageAttachment.image = UIImage(systemName: "plus")?.withTintColor(AppColor.Theme)
		imageAttachment.bounds = CGRect(x: 0, y: -3, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)

		let attachmentString = NSAttributedString(attachment: imageAttachment)
		let completeText = NSMutableAttributedString(string: "Add")
		let spaceText = NSMutableAttributedString(string: " ")
		completeText.append(spaceText)

		completeText.append(attachmentString)
		completeText.addAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], range: NSRange(location: 0, length: 3))

		let button = UIButton()
		button.setAttributedTitle(completeText, for: .normal)
		button.addTarget(self, action: #selector(actionAdd), for: .touchUpInside)
		return button
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSubTitle.text = "5 playlists"

		playlists.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Pop Music"
		dict1["songs"] = "16 songs"
		playlists.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "New Music"
		dict2["songs"] = "31 songs"
		playlists.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Dance Hits"
		dict3["songs"] = "4 songs"
		playlists.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Popular of 2018"
		dict4["songs"] = "12 songs"
		playlists.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "90's Hits"
		dict5["songs"] = "46 songs"
		playlists.append(dict5)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd() {

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
extension PlaylistsView: UIScrollViewDelegate {

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

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension PlaylistsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return playlists.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistsCell", for: indexPath) as! PlaylistsCell
		cell.bindData(data: playlists[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension PlaylistsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
