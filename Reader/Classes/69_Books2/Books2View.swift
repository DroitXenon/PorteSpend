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
class Books2View: UIViewController {

	@IBOutlet var buttonTab1: UIButton!
	@IBOutlet var buttonTab2: UIButton!
	@IBOutlet var buttonTab3: UIButton!

	@IBOutlet var viewTab1: UIView!
	@IBOutlet var viewTab2: UIView!
	@IBOutlet var viewTab3: UIView!

	@IBOutlet var collectionView: UICollectionView!

	private var books: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Classics"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(actionSettings(_:)))

		collectionView.register(UINib(nibName: "Books2Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Books2Cell")

		updateUI()
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		buttonTab1.isSelected = true

		books.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "The 7 Habits of Highly Effective People"
		dict1["author"] = "Stephen Covey"
		dict1["date"] = "Mar 17, 2020"
		dict1["rating"] = "4.7"
		dict1["review"] = "811"
		books.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Something I Never Told You"
		dict2["author"] = "Shravya Bhinder"
		dict2["date"] = "Mar 24, 2020"
		dict2["rating"] = "4.0"
		dict2["review"] = "894"
		books.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "This is Not Your Story"
		dict3["author"] = "Savi Sharma"
		dict3["date"] = "Mar 15, 2020"
		dict3["rating"] = "3.5"
		dict3["review"] = "11.2k"
		books.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "How to Win Friends and Influence People"
		dict4["author"] = "Dale Carnegie"
		dict4["date"] = "Mar 14, 2020"
		dict4["rating"] = "1.8"
		dict4["review"] = "682"
		books.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Dear Stranger, I Know How You Feel"
		dict5["author"] = "Ashish Bagrecha"
		dict5["date"] = "Mar 14, 2020"
		dict5["rating"] = "2.4"
		dict5["review"] = "258"
		books.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Who Moved My Cheese?"
		dict6["author"] = "Spencer Johnson"
		dict6["date"] = "Mar 10, 2020"
		dict6["rating"] = "4.9"
		dict6["review"] = "331"
		books.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "The Magic of Thinking Big"
		dict7["author"] = "David J. Schwartz"
		dict7["date"] = "Mar 19, 2020"
		dict7["rating"] = "3.9"
		dict7["review"] = "19.5k"
		books.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Think & Grow Rich"
		dict8["author"] = "Napolean Hill"
		dict8["date"] = "Mar 15, 2020"
		dict8["rating"] = "5.0"
		dict8["review"] = "276"
		books.append(dict8)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		buttonTab1.titleLabel?.textColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.label
		buttonTab2.titleLabel?.textColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.label
		buttonTab3.titleLabel?.textColor = buttonTab3.isSelected ? AppColor.Theme : UIColor.label

		viewTab1.backgroundColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
		viewTab2.backgroundColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
		viewTab3.backgroundColor = buttonTab3.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSettings(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab1(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = true
		buttonTab2.isSelected = false
		buttonTab3.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab2(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = true
		buttonTab3.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab3(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = false
		buttonTab3.isSelected = true
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Books2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return books.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Books2Cell", for: indexPath) as! Books2Cell
		cell.bindData(index: indexPath.item, data: books[indexPath.row])
		cell.buttonAdd.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Books2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		dismiss(animated: true, completion: nil)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Books2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-45)/2
		return CGSize(width: width, height: 325)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 15
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 15
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
	}
}
