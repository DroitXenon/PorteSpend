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
class AboutView: UIViewController {

	@IBOutlet var imageAbout: UIImageView!

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelDescription: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "About Shop"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Contacts", style: .done, target: self, action: #selector(actionContacts(_:)))

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageAbout.sample("Ecommerce", "Furniture", 7)
		labelTitle.text = "Who We Are"
		labelDescription.text = """
		We believe in a world where you have total freedom to be you, without judgement. To experiment. To express yourself. To be brave and grab life as the extraordinary adventure it is.

		So we make sure everyone has an equal chance to discover all the amazing things they’re capable of – no matter who they are, where they’re from or what looks they like to boss. We exist to give you the confidence to be whoever you want to be.

		In the early 1970's, founder Marley Hodgson found himself at an estate sale in the UK where he encountered a rare collection of camping gear including boots, belts and backpacks, that once belonged to a British Toriox commander at the turn of the century. While nearly 100 years old, the leather remained supple, sturdy and full of character. Captivated by the collection, Marley returned to the US and made his first Toriox bag – a leather knapsack. In 1975, with the world's finest leathers, the utmost attention to detail and respect for the craft, Marley designed his first Toriox collection at a factory in Norwalk, Connecticut.

		As an homage to the spirit of the Toriox soldiers and reverence for the craftsmanship of the commander's original bags, Toriox was born. Over 40 years on, proud artisans continue to uphold the craftsmanship and quality that generations of fans have come to expect from the Toriox name.
		"""
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionContacts(_ sender: UIButton) {

		print(#function)
	}
}
