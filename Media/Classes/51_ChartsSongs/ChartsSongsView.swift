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
class ChartsSongsView: UIViewController {

	@IBOutlet var segmentControl: UISegmentedControl!
	@IBOutlet var tableView: UITableView!

	private var songs: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Top Charts"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		segmentControl.setTitleTextAttributes(
			[NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
		segmentControl.setTitleTextAttributes(
			[NSAttributedString.Key.foregroundColor: AppColor.Theme], for: .normal)

		tableView.tableHeaderView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: tableView.frame.size.width, height: 58)))
		tableView.register(UINib(nibName: "ChartsSongsCell", bundle: nil), forCellReuseIdentifier: "ChartsSongsCell")

		updateUI()
		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .automatic
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

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

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		let background = UIColor.systemBackground.image(segmentControl.frame.size)
		let selected = AppColor.Theme.image(segmentControl.frame.size)

		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
		segmentControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
		segmentControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
		segmentControl.setDividerImage(AppColor.Theme.image(), forLeftSegmentState: .normal, rightSegmentState: [.normal, .highlighted, .selected], barMetrics: .default)
		segmentControl.layer.borderWidth = 1
		segmentControl.layer.borderColor = AppColor.Theme.cgColor
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSegment(_ sender: Any) {

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
extension ChartsSongsView: UITableViewDataSource {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "ChartsSongsCell", for: indexPath) as! ChartsSongsCell
		cell.bindData(data: songs[indexPath.row], index: indexPath.row + 1)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ChartsSongsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - UIColor
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension UIColor {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

		return UIGraphicsImageRenderer(size: size).image { rendererContext in
			setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}
