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
class SubscribeView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var subscribes: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Subscribe List"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: setupSortButton())

		tableView.register(UINib(nibName: "SubscribeCell", bundle: nil), forCellReuseIdentifier: "SubscribeCell")

		tableView.tableFooterView = UIView()

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .automatic
	}

	// MARK: - Navigation methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setupSortButton() -> UIButton {

		let imageAttachment = NSTextAttachment()
		imageAttachment.image = UIImage(systemName: "arrow.up.arrow.down")?.withTintColor(AppColor.Theme)
		imageAttachment.bounds = CGRect(x: 0, y: -3, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)

		let attachmentString = NSAttributedString(attachment: imageAttachment)
		let completeText = NSMutableAttributedString(string: "Sort")
		let spaceText = NSMutableAttributedString(string: " ")
		completeText.append(spaceText)

		completeText.append(attachmentString)
		completeText.addAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], range: NSRange(location: 0, length: 4))

		let button = UIButton()
		button.setAttributedTitle(completeText, for: .normal)
		button.addTarget(self, action: #selector(actionSort), for: .touchUpInside)
		return button
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		subscribes.removeAll()

		var dict1: [String: String] = [:]
		dict1["image"] = "person.fill"
		dict1["name"] = "Eugenia Wilkerson"
		dict1["subscribers"] = "795K subscribers"
		dict1["videos"] = "974 videos"
		subscribes.append(dict1)

		var dict2: [String: String] = [:]
		dict2["image"] = "star.fill"
		dict2["name"] = "PewDiePie"
		dict2["subscribers"] = "65M subscribers"
		dict2["videos"] = "3.9K videos"
		subscribes.append(dict2)

		subscribes.append(dict1)
		subscribes.append(dict2)
		subscribes.append(dict1)
		subscribes.append(dict2)
		subscribes.append(dict1)
		subscribes.append(dict2)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSort() {

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
extension SubscribeView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return subscribes.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "SubscribeCell", for: indexPath) as! SubscribeCell
		cell.bindData(data: subscribes[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SubscribeView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
