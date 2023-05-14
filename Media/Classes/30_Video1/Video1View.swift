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
class Video1View: UIViewController {

	@IBOutlet var imageViewVideo: UIImageView!
	@IBOutlet var buttonPlayPause: UIButton!
	@IBOutlet var labelTimeElapsed: UILabel!
	@IBOutlet var progressView: UIProgressView!
	@IBOutlet var labelVideoTitle: UILabel!
	@IBOutlet var labelViews: UILabel!
	@IBOutlet var labelLikeCount: UILabel!
	@IBOutlet var labelDislikeCount: UILabel!
	@IBOutlet var imageViewChannel: UIImageView!
	@IBOutlet var labelChannelName: UILabel!
	@IBOutlet var labelSubscribersCount: UILabel!
	@IBOutlet var switchAutoPlay: UISwitch!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableViewHeight: NSLayoutConstraint!

	private var navigationBackgroundImage: UIImage?
	private var videos: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .done, target: self, action: #selector(actionMinimize))
		navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore)), UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(actionSetting))]

		tableView.register(UINib(nibName: "Video1Cell", bundle: nil), forCellReuseIdentifier: "Video1Cell")

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

		imageViewVideo.sample("Media", "Bands", 21)
		labelTimeElapsed.text = "0:10 - 11:19"
		progressView.progress = 0.5
		labelVideoTitle.text = "AC/DC - Thunderstruck (Official Video)"
		labelViews.text = "466M views · 5 years ago"
		labelLikeCount.text = "1.9M"
		labelDislikeCount.text = "108K"
		imageViewChannel.sample("Media", "Bands", 29)
		labelChannelName.text = "AC/DC Official"
		labelSubscribersCount.text = "3.8M subscribers"
		switchAutoPlay.isOn = true

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
	@objc func actionSetting() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPlayPause(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionScreenShare(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionExpandVideo(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionExpandVideoInfo(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLike(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDislike(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionShareVideo(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSubscribe(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionComments(_ sender: Any) {

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
extension Video1View: UITableViewDataSource {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "Video1Cell", for: indexPath) as! Video1Cell
		cell.bindData(index: indexPath.item, data: videos[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Video1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
