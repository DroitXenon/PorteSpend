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
class ChannelView: UIViewController {

	@IBOutlet var imageViewCover: UIImageView!
	@IBOutlet var imageViewChannel: UIImageView!
	@IBOutlet var labelChannelName: UILabel!
	@IBOutlet var imageViewVerified: UIImageView!
	@IBOutlet var labelSubscribers: UILabel!
	@IBOutlet var labelVideos: UILabel!
	@IBOutlet var segmentControl: UISegmentedControl!
	@IBOutlet var imageViewVideo: UIImageView!
	@IBOutlet var buttonLikeDislike: UIButton!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var buttonOption: UIButton!
	@IBOutlet var labelViews: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableViewHeight: NSLayoutConstraint!
	@IBOutlet var buttonSubscribe: UIButton!

	private var navigationBackgroundImage: UIImage?
	private var videos: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore)), UIBarButtonItem(customView: buttonSubscribe)]

		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: AppColor.Theme], for: .normal)

		tableView.register(UINib(nibName: "ChannelCell", bundle: nil), forCellReuseIdentifier: "ChannelCell")

		updateUI()
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

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewCover.sample("Media", "Music", 26)
		imageViewChannel.sample("Media", "Film", 8)
		labelChannelName.text = "AC/DC Official"
		imageViewVerified.isHidden = false
		labelSubscribers.text = "65M subs"
		labelVideos.text = "3.9K videos"
		imageViewVideo.sample("Media", "Music", 15)
		labelTitle.text = "AC/DC - Thunderstruck (Official Video)"
		labelViews.text = "466M views · 5 years ago"

		videos.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "AC/DC - Thunderstruck (Official Video)"
		dict1["views"] = "466M views · 5 years ago"
		dict1["type"] = "AC/DC Official"
		videos.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Evanescence - My Immortal)"
		dict2["views"] = "510M views · 8 years ago"
		dict2["type"] = "Evanescence"
		videos.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Call Me - Shinedown Lyrics"
		dict3["views"] = "466M views · 5 years ago"
		dict3["type"] = "AC/DC Official"
		videos.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Shinedown - 45 (Official Music Video)"
		dict4["views"] = "510M views · 8 years ago"
		dict4["type"] = "Evanescence"
		videos.append(dict4)

		videos.append(dict1)
		videos.append(dict2)
		videos.append(dict3)
		videos.append(dict4)

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
	@IBAction func actionSubscribe(_ sender: Any) {

		buttonSubscribe.isSelected = !buttonSubscribe.isSelected
		if buttonSubscribe.isSelected {
			buttonSubscribe.backgroundColor = UIColor.systemBackground
			buttonSubscribe.borderColor = AppColor.Border
			buttonSubscribe.borderWidth = 0.5
			buttonSubscribe.tintColor = UIColor.label
		}
		else {
			buttonSubscribe.backgroundColor = AppColor.Theme
			buttonSubscribe.borderWidth = 0
			buttonSubscribe.tintColor = UIColor.white
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSegment(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionVideoLikeDislike(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionVideoMoreOption(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllRecent(_ sender: Any) {

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
extension ChannelView: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.contentOffset.y >= imageViewChannel.frame.origin.y {
			navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
			title = "AC/DC Official"
		}
		else {
			navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
			title = ""
		}
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ChannelView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return videos.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as! ChannelCell
		cell.bindData(index: indexPath.item, data: videos[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ChannelView: UITableViewDelegate {

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
