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
import SoundWave

//-----------------------------------------------------------------------------------------------------------------------------------------------
class VoiceRecorderView: UIViewController {

	@IBOutlet var viewSoundWaves: AudioVisualizationView!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var buttonPlay: UIButton!
	@IBOutlet var buttonPause: UIButton!
	@IBOutlet var buttonDone: UIButton!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableViewHeight: NSLayoutConstraint!

	private var recordings: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Voice Recorder"

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "tray.and.arrow.up.fill"), style: .done, target: self, action: #selector(actionOpenWith))

		tableView.register(UINib(nibName: "VoiceRecorderCell", bundle: nil), forCellReuseIdentifier: "VoiceRecorderCell")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintTableViewHeight.constant = tableView.contentSize.height
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTime.text = "00:02:52"
		labelTitle.text = "New Recording"
		labelDate.text = "14 Aug 2018"

		viewSoundWaves.audioVisualizationMode = .read
		viewSoundWaves.meteringLevels = [0.1, 0.67, 0.13, 0.78, 0.31, 0.5, 0.2, 0.7, 0.1, 0.9]
		for _ in 0..<5 {
			viewSoundWaves.meteringLevels?.append(contentsOf: [0.1, 0.67, 0.13, 0.78, 0.31, 0.5, 0.2, 0.7, 0.1, 0.9])
		}
		viewSoundWaves.play(for: 20)

		recordings.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Recording #1"
		dict1["date"] = "14 Aug 2018"
		dict1["duration"] = "00:00:48"
		recordings.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Recording #2"
		dict2["date"] = "15 Aug 2018"
		dict2["duration"] = "00:01:48"
		recordings.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Recording #3"
		dict3["date"] = "15 Aug 2018"
		dict3["duration"] = "00:11:48"
		recordings.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Recording #4"
		dict4["date"] = "16 Aug 2018"
		dict4["duration"] = "00:20:48"
		recordings.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Recording #5"
		dict5["date"] = "17 Aug 2018"
		dict5["duration"] = "00:00:50"
		recordings.append(dict5)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionOpenWith() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPlay(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPause(_ sender: Any) {

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

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension VoiceRecorderView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return recordings.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "VoiceRecorderCell", for: indexPath) as! VoiceRecorderCell
		cell.bindData(data: recordings[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension VoiceRecorderView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
