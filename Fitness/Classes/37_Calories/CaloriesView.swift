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
class CaloriesView: UIViewController {

	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var labelPercentage: UILabel!

	@IBOutlet var viewCircularProgressCarb: CaloriesCircularProgressView!
	@IBOutlet var viewCircularProgressProtein: CaloriesCircularProgressView!
	@IBOutlet var viewCircularProgressFat: CaloriesCircularProgressView!

	@IBOutlet var labelGCarb: UILabel!
	@IBOutlet var labelGProtein: UILabel!
	@IBOutlet var labelGFat: UILabel!
	@IBOutlet var labelPercentageCarb: UILabel!
	@IBOutlet var labelPercentageProtein: UILabel!
	@IBOutlet var labelPercentageFat: UILabel!

	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var calories: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "1730 kcal"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))

		tableView.register(UINib(nibName: "CaloriesCell", bundle: Bundle.main), forCellReuseIdentifier: "CaloriesCell")

		viewCircularProgressCarb.progressColor = AppColor.Theme
		viewCircularProgressProtein.progressColor = AppColor.Theme.withAlphaComponent(0.5)
		viewCircularProgressFat.progressColor = UIColor.darkGray

		loadData()
		layoutConstraintTableViewHeight.constant = CGFloat(100 * calories.count)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSubTitle.text = "23 April 2020"
		labelPercentage.text = "59%"

		viewCircularProgressCarb.setProgress(0.75)
		viewCircularProgressProtein.setProgress(0.5)
		viewCircularProgressFat.setProgress(0.25)

		labelGCarb.text = "35 g"
		labelGProtein.text = "14 g"
		labelGFat.text = "4.5 g"
		labelPercentageCarb.text = "75%"
		labelPercentageProtein.text = "50%"
		labelPercentageFat.text = "25%"

		calories.removeAll()

		var dict1: [String: String] = [:]
		dict1["time"] = "Breakfast"
		dict1["cal"] = "350"
		dict1["carb"] = "13"
		dict1["protein"] = "5"
		dict1["fat"] = "2"
		calories.append(dict1)

		var dict2: [String: String] = [:]
		dict2["time"] = "Lunch"
		dict2["cal"] = "340"
		dict2["carb"] = "12"
		dict2["protein"] = "4"
		dict2["fat"] = "1.5"
		calories.append(dict2)

		var dict3: [String: String] = [:]
		dict3["time"] = "Dinner"
		dict3["cal"] = "330"
		dict3["carb"] = "10"
		dict3["protein"] = "4"
		dict3["fat"] = "1"
		calories.append(dict3)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionTime(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CaloriesView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return calories.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "CaloriesCell", for: indexPath) as! CaloriesCell
		cell.bindData(data: calories[indexPath.row])
		cell.buttonTime.addTarget(self, action: #selector(actionTime(_:)), for: .touchUpInside)
		cell.buttonAdd.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CaloriesView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 100
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
