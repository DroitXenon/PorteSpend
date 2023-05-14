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
class Butterfly1View: UIViewController {

	@IBOutlet var pageControl: UIPageControl!
	@IBOutlet var collectionView: UICollectionView!

	private var data: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(actionClose(_:)))

		collectionView.register(UINib(nibName: "Butterfly1Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Butterfly1Cell")
		loadData()
		pageControl.numberOfPages = data.count
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

		data.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Supermans"
		dict1["description"] = "Who doesn't want to think they have super powers?"
		dict1["raps"] = "4"
		dict1["totalRaps"] = "15"
		data.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Push-up"
		dict2["description"] = "The Push-up is an oldie but goodie.  You can modify intensity by changing hand placement."
		dict2["raps"] = "4"
		dict2["totalRaps"] = "15"
		data.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Contralateral Limb Raises"
		dict3["description"] = "Don’t let the name scare you – this is great for toning those troubling upper body areas."
		dict3["raps"] = "4"
		dict3["totalRaps"] = "15"
		data.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Bent Knee Push-up"
		dict4["description"] = "A great starting option if you struggle with the correct form using a full Push-Up."
		dict4["raps"] = "4"
		dict4["totalRaps"] = "15"
		data.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Downward-facing Dog"
		dict5["description"] = "Slow and controlled movement very important – wonderful calf stretch."
		dict5["raps"] = "4"
		dict5["totalRaps"] = "15"
		data.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Bent-Knee Sit-up / Crunches"
		dict6["description"] = "Most people don’t know how to perform a proper sit-up/crunch – that is until now.  Core Power!"
		dict6["raps"] = "4"
		dict6["totalRaps"] = "15"
		data.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Push-up with Single-leg Raise"
		dict7["description"] = "A great progression from a regular Push-Up but remember to keep proper form."
		dict7["raps"] = "4"
		dict7["totalRaps"] = "15"
		data.append(dict7)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionClose(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSave(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionLearnMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Butterfly1View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return data.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Butterfly1Cell", for: indexPath) as! Butterfly1Cell
		cell.bindData(index: indexPath, data: data[indexPath.row])
		cell.buttonSave.addTarget(self, action: #selector(actionSave(_:)), for: .touchUpInside)
		cell.buttonLearnMore.addTarget(self, action: #selector(actionLearnMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Butterfly1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Butterfly1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return collectionView.frame.size
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets.zero
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Butterfly1View: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
		let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

		if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
			pageControl.currentPage = visibleIndexPath.row
		}
	}
}
