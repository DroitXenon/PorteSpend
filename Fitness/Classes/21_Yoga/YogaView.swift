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
class YogaView: UIViewController {

	@IBOutlet var imageViewYoga: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var viewRate: UIView!
	@IBOutlet var labelRate: UILabel!
	@IBOutlet var labelReviews: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelDays: UILabel!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var plans: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		viewRate.layer.borderWidth = 1
		viewRate.layer.borderColor = AppColor.Border.cgColor

		tableView.register(UINib(nibName: "YogaCell", bundle: Bundle.main), forCellReuseIdentifier: "YogaCell")
		loadData()
		layoutConstraintTableViewHeight.constant = CGFloat(60 * plans.count)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setBackground(color: .clear)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setNavigationBar()
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewYoga.sample("Fitness", "Yoga", 17)
		labelTitle.text = "Yoga"
		labelRate.text = "4.9"
		labelReviews.text = "48 Reviews"
		labelDescription.text = "Browse our extensive yoga sequence library and find a home practice that fits into your schedule. We break up our yoga sequences into levels of difficulty so you're keeping your body safe in every pose. Or search through our list of yoga sequences by anatomy to target different aspects of the body. We also break down our sequences into different types, in case you're looking for the perfect Kundalini or Ashtanga sequence. In a hurry? Search our yoga sequences by length, so you can fit in your workout during any time crunch."
		labelDays.text = "28"
		labelTime.text = "15"

		plans.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "The Meaning of \"Namaste\""
		dict1["time"] = "15 min"
		plans.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "How Often Should You Practice Yoga?"
		dict2["time"] = "15 min"
		plans.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "A Safe, Core-Supported Backbending Sequence"
		dict3["time"] = "20 min"
		plans.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "A Home Practice for Happy, Open Hips"
		dict4["time"] = "15 min"
		plans.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "A Tapas-Building Sequence to Fuel Willpower"
		dict5["time"] = "30 min"
		plans.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Challenge Pose: Flying Pigeon (Eka Pada Galavasana)"
		dict6["time"] = "25 min"
		plans.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Two Fit Moms: 8 Poses to Prep You for Hanumanasana"
		dict7["time"] = "15 min"
		plans.append(dict7)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension YogaView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return plans.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "YogaCell", for: indexPath) as! YogaCell
		cell.bindData(index: indexPath, data: plans[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension YogaView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 60
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension YogaView: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.tag == 11 {
			if let navController = navigationController as? NavigationController {
				if (scrollView.contentOffset.y > imageViewYoga.frame.size.height/2) {
					navController.setBackground(color: .systemBackground)
				} else {
					navController.setBackground(color: .clear)
				}
			}
		}
	}
}
