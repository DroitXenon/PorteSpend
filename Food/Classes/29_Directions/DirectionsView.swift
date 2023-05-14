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
class DirectionsView: UIViewController {

	@IBOutlet var labelDescriptions: UILabel!
	@IBOutlet var tableView: UITableView!

	private var directions: [[String: String]] = []
	private var selectedDirections: Set<IndexPath> = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Directions"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))

		tableView.register(UINib(nibName: "DirectionsCell", bundle: Bundle.main), forCellReuseIdentifier: "DirectionsCell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelDescriptions.text = "Herbs are fun and easy to grow. When harvested they make even the simplest meal seem like a gourmet delight. By using herbs in your cooking you."

		directions.removeAll()

		var dict1: [String: String] = [:]
		dict1["index"] = "1"
		dict1["indexText"] = "Step One"
		dict1["description"] = "Combine onion, garlic, celery, potatoes, Old Bay and salt in a 4-quart slow cooker, Dutch oven or pot. In a bowl, stir together cornstarch, broth and 1-1/2 cups water and pour over vegetables. Cover and cook until potatoes are tender, 8 hr on low or 4 hr on high for slow cooker or 1-1/2 hr at a simmer on the stove."
		directions.append(dict1)

		var dict2: [String: String] = [:]
		dict2["index"] = "2"
		dict2["indexText"] = "Step Two"
		dict2["description"] = "Adjust heat to high if using low heat on the slow cooker; stir in fish, lemon zest and half-and-half and cook until fish is cooked through, 20 min for slow cooker or 15 min at a simmer on the stove. Sprinkle with parsley. Makes 6 servings."
		directions.append(dict2)

		var dict3: [String: String] = [:]
		dict3["index"] = "3"
		dict3["indexText"] = "Step Three"
		dict3["description"] = "In a bowl, stir together cornstarch, broth and 1-1/2 cups water and pour over vegetables. Cover and cook until potatoes are tender, 8 hr on low or 4 hr on high for slow cooker or 1-1/2 hr at a simmer on the stove."
		directions.append(dict3)

		var dict4: [String: String] = [:]
		dict4["index"] = "4"
		dict4["indexText"] = "Step Four"
		dict4["description"] = "Combine onion, garlic, celery, potatoes, Old Bay and salt in a 4-quart slow cooker, Dutch oven or pot. In a bowl, stir together cornstarch, broth and 1-1/2 cups water and pour over vegetables. Cover and cook until potatoes are tender, 8 hr on low or 4 hr on high for slow cooker or 1-1/2 hr at a simmer on the stove."
		directions.append(dict4)

		var dict5: [String: String] = [:]
		dict5["index"] = "5"
		dict5["indexText"] = "Step Five"
		dict5["description"] = "Adjust heat to high if using low heat on the slow cooker; stir in fish, lemon zest and half-and-half and cook until fish is cooked through, 20 min for slow cooker or 15 min at a simmer on the stove. Sprinkle with parsley. Makes 6 servings."
		directions.append(dict5)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension DirectionsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return directions.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "DirectionsCell", for: indexPath) as! DirectionsCell
		cell.bindData(data: directions[indexPath.row])
		cell.set(isSelected: selectedDirections.contains(indexPath))
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension DirectionsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 25
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return "TITLE"
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			let viewY = header.frame.size.height - 0.5
			let view = UIView(frame: CGRect(x: 0, y: viewY, width: header.frame.size.width, height: 0.5))
			view.backgroundColor = .tertiarySystemFill
			view.tag = 1001
			header.contentView.subviews.forEach { (view) in
				if (view.tag == 1001) {
					view.removeFromSuperview()
				}
			}
			header.contentView.addSubview(view)
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
		if selectedDirections.contains(indexPath) {
			selectedDirections.remove(indexPath)
		} else {
			selectedDirections.insert(indexPath)
		}
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}
}
