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
import Magnetic

//-----------------------------------------------------------------------------------------------------------------------------------------------
class ChooseGenresView: UIViewController {

	@IBOutlet var magneticView: MagneticView!

	private var navigationBackgroundImage: UIImage?
	private var genres: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .done, target: self, action: #selector(actionSkip))

		magneticView.magnetic.backgroundColor = .systemBackground

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		genres.removeAll()

		var dict1: [String: Any] = [:]
		var dict2: [String: Any] = [:]
		var dict3: [String: Any] = [:]
		var dict4: [String: Any] = [:]
		var dict5: [String: Any] = [:]
		var dict6: [String: Any] = [:]
		var dict7: [String: Any] = [:]
		var dict8: [String: Any] = [:]
		var dict9: [String: Any] = [:]
		var dict10: [String: Any] = [:]

		dict1["title"] = "Jazz"
		dict1["radius"] = 50

		dict2["title"] = "Dance"
		dict2["radius"] = 50

		dict3["title"] = "R&B"
		dict3["radius"] = 40

		dict4["title"] = "Rap/Hip-Hop"
		dict4["radius"] = 60

		dict5["title"] = "Alternative"
		dict5["radius"] = 50

		dict6["title"] = "Classical"
		dict6["radius"] = 50

		dict7["title"] = "Rock"
		dict7["radius"] = 45

		dict8["title"] = "Electronic"
		dict8["radius"] = 50

		dict9["title"] = "Metal"
		dict9["radius"] = 45

		dict10["title"] = "Pop"
		dict10["radius"] = 40

		genres = [dict1, dict2, dict3, dict4, dict5, dict6, dict7, dict8, dict9, dict10]

		for dict in genres {
			guard let title = dict["title"] as? String else { return }
			guard let radius = dict["radius"] as? Int else { return }
			let node = Node(text: title, image: nil, color: .tertiarySystemFill, radius: CGFloat(radius))
			node.label.fontName = "Helvetica"
			node.label.fontSize = 15.0
			node.label.fontColor = .label
			magneticView.magnetic.addChild(node)
		}
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSkip() {

		print(#function)
	}
}
