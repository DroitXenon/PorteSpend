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
class Feed4View: UIViewController {

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var viewTitle: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var tableView: UITableView!

	private var feeds: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewTitle)
		let buttonSearch = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(actionSearch(_:)))
		let buttonMenu = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))
		navigationItem.rightBarButtonItems = [buttonMenu, buttonSearch]

		tableView.register(UINib(nibName: "Feed4Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Feed4Cell1")
		tableView.register(UINib(nibName: "Feed4Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Feed4Cell2")
		tableView.register(UINib(nibName: "Feed4Cell3", bundle: Bundle.main), forCellReuseIdentifier: "Feed4Cell3")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageView.sample("Social", "Portraits", 17)
		labelTitle.text = "AppDesignKit"

		feeds.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Emma Harris"
		dict1["time"] = "Now"
		dict1["content"] = "So many work, so little time."
		dict1["likes"] = "516 likes"
		dict1["comments"] = "6 comments"
		dict1["shares"] = "61 shares"
		feeds.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Alan Nickerson"
		dict2["withName"] = "Fabia Smith"
		dict2["time"] = "2 min ago"
		dict2["content"] = "New York, When television was young, there was a hugely popular show based on the still popular fictional character of Superman."
		dict2["likes"] = "831 likes"
		dict2["comments"] = "61 comments"
		dict2["shares"] = "8 shares"
		feeds.append(dict2)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSearch(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionPhotos(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionVideo(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionLocation(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionLike(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionComment(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

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
extension Feed4View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.row == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Feed4Cell1", for: indexPath) as! Feed4Cell1
			cell.buttonPhotos.addTarget(self, action: #selector(actionPhotos(_:)), for: .touchUpInside)
			cell.buttonVideo.addTarget(self, action: #selector(actionVideo(_:)), for: .touchUpInside)
			cell.buttonLocation.addTarget(self, action: #selector(actionLocation(_:)), for: .touchUpInside)
			cell.bindData(index: indexPath.item, data: "What’s new, Brian?")
			return cell
		}
		if (indexPath.row == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Feed4Cell2", for: indexPath) as! Feed4Cell2
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			cell.buttonlike.addTarget(self, action: #selector(actionLike(_:)), for: .touchUpInside)
			cell.buttonShare.addTarget(self, action: #selector(actionShare(_:)), for: .touchUpInside)
			cell.bindData(index: indexPath.item, data: feeds[0])
			return cell
		}
		if (indexPath.row == 2) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Feed4Cell3", for: indexPath) as! Feed4Cell3
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			cell.buttonlike.addTarget(self, action: #selector(actionLike(_:)), for: .touchUpInside)
			cell.buttonShare.addTarget(self, action: #selector(actionShare(_:)), for: .touchUpInside)
			cell.bindData(index: indexPath.item, data: feeds[1])
			return cell
		}
		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Feed4View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
