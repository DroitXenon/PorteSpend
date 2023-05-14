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
class BaseView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var names: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "List of Views"

		navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

		tableView.tableFooterView = UIView()

		names.append("Login1View")
		names.append("Login2View")
		names.append("Login3View")
		names.append("Login4View")
		names.append("SignUp1View")
		names.append("SignUp2View")
		names.append("PhoneView")
		names.append("SecureCodeView")
		names.append("Location1View")
		names.append("Location2View")
		names.append("NotificationView")
		names.append("PasscodeView")
		names.append("PlanView")
		names.append("Walkthrough1View")
		names.append("Walkthrough2View")
		names.append("Walkthrough3View")
		names.append("Walkthrough4View")
		names.append("Walkthrough5View")
		names.append("Home1View")
		names.append("TrainingView")
		names.append("YogaView")
		names.append("Butterfly1View")
		names.append("Butterfly2View")
		names.append("VideoView")
		names.append("SearchView")
		names.append("Running1View")
		names.append("CreateTrainingView")
		names.append("EditTrainingView")
		names.append("Profile2View")
		names.append("StepsView")
		names.append("Profile1View")
		names.append("WeightView")
		names.append("SleepTimeView")
		names.append("ReminderView")
		names.append("BadgeView")
		names.append("WaterView")
		names.append("CaloriesView")
		names.append("Running2View")
		names.append("RepeatsView")
		names.append("Profile3View")
		names.append("MapView")
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return names.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
		if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

		cell.textLabel?.text = "\(indexPath.row+1). " + names[indexPath.row]

		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		switch names[indexPath.row] {

			case "Login1View":
				let login1View = Login1View()
				login1View.isModalInPresentation = true
				login1View.modalPresentationStyle = .fullScreen
				present(login1View, animated: true)

			case "Login2View":
				let login2View = Login2View()
				login2View.isModalInPresentation = true
				login2View.modalPresentationStyle = .fullScreen
				present(login2View, animated: true)

			case "Login3View":
				let login3View = Login3View()
				login3View.isModalInPresentation = true
				login3View.modalPresentationStyle = .fullScreen
				present(login3View, animated: true)

			case "Login4View":
				let login4View = Login4View()
				login4View.isModalInPresentation = true
				login4View.modalPresentationStyle = .fullScreen
				present(login4View, animated: true)

			case "SignUp1View":
				let signUp1View = SignUp1View()
				let navigation = NavigationController(rootViewController: signUp1View)
				navigation.isModalInPresentation = true
				navigation.navigationBar.isTranslucent = false
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "SignUp2View":
				let signUp2View = SignUp2View()
				let navigation = NavigationController(rootViewController: signUp2View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PhoneView":
				let phoneView = PhoneView()
				navigationController?.pushViewController(phoneView, animated: true)

			case "SecureCodeView":
				let secureCodeView = SecureCodeView()
				navigationController?.pushViewController(secureCodeView, animated: true)

			case "Location1View":
				let location1View = Location1View()
				navigationController?.pushViewController(location1View, animated: true)

			case "Location2View":
				let location2View = Location2View()
				navigationController?.pushViewController(location2View, animated: true)

			case "NotificationView":
				let notificationView = NotificationView()
				let navigation = NavigationController(rootViewController: notificationView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PasscodeView":
				let passcodeView = PasscodeView()
				let navigation = NavigationController(rootViewController: passcodeView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PlanView":
				let planView = PlanView()
				navigationController?.pushViewController(planView, animated: true)

			case "Walkthrough1View":
				let walkthrough1View = Walkthrough1View()
				let navigation = NavigationController(rootViewController: walkthrough1View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough2View":
				let walkthrough2View = Walkthrough2View()
				let navigation = NavigationController(rootViewController: walkthrough2View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough3View":
				let walkthrough3View = Walkthrough3View()
				let navigation = NavigationController(rootViewController: walkthrough3View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough4View":
				let walkthrough4View = Walkthrough4View()
				walkthrough4View.isModalInPresentation = true
				walkthrough4View.modalPresentationStyle = .fullScreen
				present(walkthrough4View, animated: true)

			case "Walkthrough5View":
				let walkthrough5View = Walkthrough5View()
				walkthrough5View.isModalInPresentation = true
				walkthrough5View.modalPresentationStyle = .fullScreen
				present(walkthrough5View, animated: true)

			case "Home1View":
				let home1View = Home1View()
				let navController = NavigationController(rootViewController: home1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "TrainingView":
				let trainingView = TrainingView()
				navigationController?.pushViewController(trainingView, animated: true)

			case "YogaView":
				let yogaView = YogaView()
				navigationController?.pushViewController(yogaView, animated: true)

			case "Butterfly1View":
				let butterfly1View = Butterfly1View()
				let navController = NavigationController(rootViewController: butterfly1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Butterfly2View":
				let butterfly2View = Butterfly2View()
				navigationController?.pushViewController(butterfly2View, animated: true)

			case "VideoView":
				let videoView = VideoView()
				let navController = NavigationController(rootViewController: videoView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "SearchView":
				let searchView = SearchView()
				navigationController?.pushViewController(searchView, animated: true)

			case "Running1View":
				let running1View = Running1View()
				navigationController?.pushViewController(running1View, animated: true)

			case "CreateTrainingView":
				let createTrainingView = CreateTrainingView()
				let navController = NavigationController(rootViewController: createTrainingView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "EditTrainingView":
				let editTrainingView = EditTrainingView()
				navigationController?.pushViewController(editTrainingView, animated: true)

			case "Profile2View":
				let profile2View = Profile2View()
				let navController = NavigationController(rootViewController: profile2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "StepsView":
				let stepsView = StepsView()
				navigationController?.pushViewController(stepsView, animated: true)

			case "Profile1View":
				let profile1View = Profile1View()
				let navController = NavigationController(rootViewController: profile1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "WeightView":
				let weightView = WeightView()
				navigationController?.pushViewController(weightView, animated: true)

			case "SleepTimeView":
				let sleepTimeView = SleepTimeView()
				let navController = NavigationController(rootViewController: sleepTimeView)
				present(navController, animated: true)

			case "ReminderView":
				let reminderView = ReminderView()
				let navController = NavigationController(rootViewController: reminderView)
				present(navController, animated: true)

			case "BadgeView":
				let badgeView = BadgeView()
				let navController = NavigationController(rootViewController: badgeView)
				present(navController, animated: true)

			case "WaterView":
				let waterView = WaterView()
				navigationController?.pushViewController(waterView, animated: true)

			case "CaloriesView":
				let caloriesView = CaloriesView()
				navigationController?.pushViewController(caloriesView, animated: true)

			case "Running2View":
				let running2View = Running2View()
				navigationController?.pushViewController(running2View, animated: true)

			case "RepeatsView":
				let repeatsView = RepeatsView()
				let navController = NavigationController(rootViewController: repeatsView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Profile3View":
				let profile3View = Profile3View()
				let navController = NavigationController(rootViewController: profile3View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "MapView":
				let mapView = MapView()
				navigationController?.pushViewController(mapView, animated: true)

			default:
				break
		}
	}
}
