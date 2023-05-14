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
import UICircularProgressRing

//-----------------------------------------------------------------------------------------------------------------------------------------------
class ChooseArtistsView: UIViewController {

	@IBOutlet var viewHeader: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableViewHeight: NSLayoutConstraint!
	@IBOutlet var progressView: UICircularProgressRing!

	private var navigationBackgroundImage: UIImage?
	private var artists: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .done, target: self, action: #selector(actionSkip))

		tableView.register(UINib(nibName: "ChooseArtistsCell", bundle: nil), forCellReuseIdentifier: "ChooseArtistsCell")
		tableView.tableFooterView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 12, height: 100)))

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

		artists.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Sofi Tukker"
		dict1["songs"] = "29 songs"
		artists.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Moby"
		dict2["songs"] = "71 songs"
		artists.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Calvin Harris"
		dict3["songs"] = "29 songs"
		artists.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Vanotek"
		dict4["songs"] = "43 songs"
		artists.append(dict4)

		artists.append(dict1)
		artists.append(dict2)
		artists.append(dict3)
		artists.append(dict4)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSkip() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDone(_ sender: Any) {

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
extension ChooseArtistsView: UIScrollViewDelegate {

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
extension ChooseArtistsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return artists.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseArtistsCell", for: indexPath) as! ChooseArtistsCell
		cell.bindData(index: indexPath.item, data: artists[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ChooseArtistsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		let cell = tableView.cellForRow(at: indexPath) as! ChooseArtistsCell
		cell.imageViewAccessory.image = UIImage(systemName: "checkmark.circle.fill")
		cell.imageViewAccessory.tintColor = AppColor.Theme
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

		print("didDeSelectItemAt \(indexPath.row)")

		let cell = tableView.cellForRow(at: indexPath) as! ChooseArtistsCell
		cell.imageViewAccessory.image = UIImage(systemName: "circle.fill")
		cell.imageViewAccessory.tintColor = UIColor.secondaryLabel
	}
}
