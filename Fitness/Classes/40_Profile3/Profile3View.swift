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
class Profile3View: UIViewController {

	@IBOutlet var labelName: UILabel!
	@IBOutlet var progressView: UIProgressView!
	@IBOutlet var labelLevel: UILabel!
	@IBOutlet var labelPercentage: UILabel!
	@IBOutlet var labelKM: UILabel!
	@IBOutlet var imageViewUser: UIImageView!
	@IBOutlet var labelFollowers: UILabel!
	@IBOutlet var labelFollowing: UILabel!

	@IBOutlet var viewStatistics: UIView!
	@IBOutlet var labelCalories: UILabel!

	@IBOutlet var labelMon: UILabel!
	@IBOutlet var labelTue: UILabel!
	@IBOutlet var labelWed: UILabel!
	@IBOutlet var labelThu: UILabel!
	@IBOutlet var labelFri: UILabel!
	@IBOutlet var labelSat: UILabel!
	@IBOutlet var labelSun: UILabel!

	@IBOutlet var viewMon: Profile3ProgressView!
	@IBOutlet var viewTue: Profile3ProgressView!
	@IBOutlet var viewWed: Profile3ProgressView!
	@IBOutlet var viewThu: Profile3ProgressView!
	@IBOutlet var viewFri: Profile3ProgressView!
	@IBOutlet var viewSat: Profile3ProgressView!
	@IBOutlet var viewSun: Profile3ProgressView!

	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var trainings: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		viewStatistics.layer.borderWidth = 1
		viewStatistics.layer.borderColor = AppColor.Border.cgColor

		tableView.register(UINib(nibName: "Profile3Cell", bundle: Bundle.main), forCellReuseIdentifier: "Profile3Cell")
		[viewMon, viewTue, viewWed, viewThu, viewFri, viewSat, viewSun].forEach { (view) in
			view!.trackColor = AppColor.Theme.withAlphaComponent(0.2)
			view!.progressColor = AppColor.Theme
		}
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelName.text = "John Smith"
		progressView.progress = 0.3
		labelLevel.text = "Beginner"
		labelPercentage.text = "34%"
		labelKM.text = "45.5 km"
		imageViewUser.sample("Social", "Profiles", 7)
		labelFollowers.text = "1208"
		labelFollowing.text = "380"

		labelCalories.text = "1605 cal"

		labelMon.text = "1"
		labelTue.text = "2"
		labelWed.text = "3"
		labelThu.text = "5"
		labelFri.text = "8"
		labelSat.text = "9"
		labelSun.text = "10"
		
		viewMon.setProgress(0.1)
		viewTue.setProgress(0.2)
		viewWed.setProgress(0.3)
		viewThu.setProgress(0.5)
		viewFri.setProgress(0.8)
		viewSat.setProgress(0.9)
		viewSun.setProgress(1.0)

		trainings.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Shoulder press"
		dict1["description"] = "You can perform the exercise standing or sitting on a regular flat bench."
		trainings.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Shoulder fly"
		dict2["description"] = "The shoulder fly (also known as a lateral raise) works the deltoid muscle of the shoulder."
		trainings.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Triceps extension"
		dict3["description"] = "Located at the back of your arms, the tricep muscles start at your shoulders and end at your elbows and contain three heads that are responsible for keeping your upper arms active."
		trainings.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Biceps curl"
		dict4["description"] = "The Bicep Curl is an essential strength training exercise you can do with dumbbells, a barbell, resistance bands or a cable machine to build strength in the upper arms."
		trainings.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Pushdown"
		dict5["description"] = "A pushdown is a strength training exercise used for strengthening the triceps muscles in the back of the arm."
		trainings.append(dict5)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
		layoutConstraintTableViewHeight.constant = CGFloat(70 * trainings.count)
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFollow(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMore(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionWeek(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile3View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return trainings.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Profile3Cell", for: indexPath) as! Profile3Cell
		cell.bindData(data: trainings[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile3View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 70
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
