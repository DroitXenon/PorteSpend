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
		names.append("RecipesList1View")
		names.append("RecipesList2View")
		names.append("RecipesList3View")
		names.append("RecipesList4View")
		names.append("Recipes1View")
		names.append("Categories1View")
		names.append("Categories2View")
		names.append("AddRecipeView")
		names.append("Home1View")
		names.append("IngredientsView")
		names.append("DirectionsView")
		names.append("ReviewsView")
		names.append("BookRestaurantView")
		names.append("RestaurantInfoView")
		names.append("Home2View")
		names.append("Home3View")
		names.append("RestaurantsList1View")
		names.append("RestaurantsList2View")
		names.append("RestaurantsMapView")
		names.append("RestaurantsList3View")
		names.append("SearchRestaurants1View")
		names.append("SearchRestaurants2View")
		names.append("Menu1View")
		names.append("Menu2View")
		names.append("Menu3View")
		names.append("Menu4View")
		names.append("DishView")
		names.append("FiltersView")
		names.append("SortByView")
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

			case "RecipesList1View":
				let recipesList1View = RecipesList1View()
				navigationController?.pushViewController(recipesList1View, animated: true)

			case "RecipesList2View":
				let recipesList2View = RecipesList2View()
				navigationController?.pushViewController(recipesList2View, animated: true)

			case "RecipesList3View":
				let recipesList3View = RecipesList3View()
				navigationController?.pushViewController(recipesList3View, animated: true)

			case "RecipesList4View":
				let recipesList4View = RecipesList4View()
				navigationController?.pushViewController(recipesList4View, animated: true)

			case "Recipes1View":
				let recipes1View = Recipes1View()
				navigationController?.pushViewController(recipes1View, animated: true)

			case "Categories1View":
				let categories1View = Categories1View()
				let navController = NavigationController(rootViewController: categories1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Categories2View":
				let categories2View = Categories2View()
				navigationController?.pushViewController(categories2View, animated: true)

			case "AddRecipeView":
				let addRecipeView = AddRecipeView()
				let navController = NavigationController(rootViewController: addRecipeView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Home1View":
				let home1View = Home1View()
				home1View.modalPresentationStyle = .fullScreen
				present(home1View, animated: true)

			case "IngredientsView":
				let ingredientsView = IngredientsView()
				navigationController?.pushViewController(ingredientsView, animated: true)

			case "DirectionsView":
				let directionsView = DirectionsView()
				navigationController?.pushViewController(directionsView, animated: true)

			case "ReviewsView":
				let reviewsView = ReviewsView()
				navigationController?.pushViewController(reviewsView, animated: true)

			case "BookRestaurantView":
				let bookRestaurantView = BookRestaurantView()
				navigationController?.pushViewController(bookRestaurantView, animated: true)

			case "RestaurantInfoView":
				let restaurantInfoView = RestaurantInfoView()
				navigationController?.pushViewController(restaurantInfoView, animated: true)

			case "Home2View":
				let home2View = Home2View()
				home2View.modalPresentationStyle = .fullScreen
				present(home2View, animated: true)

			case "Home3View":
				let home3View = Home3View()
				home3View.modalPresentationStyle = .fullScreen
				present(home3View, animated: true)

			case "RestaurantsList1View":
				let restaurantsList1View = RestaurantsList1View()
				navigationController?.pushViewController(restaurantsList1View, animated: true)

			case "RestaurantsList2View":
				let restaurantsList2View = RestaurantsList2View()
				navigationController?.pushViewController(restaurantsList2View, animated: true)

			case "RestaurantsMapView":
				let restaurantsMapView = RestaurantsMapView()
				navigationController?.pushViewController(restaurantsMapView, animated: true)

			case "RestaurantsList3View":
				let restaurantsList3View = RestaurantsList3View()
				navigationController?.pushViewController(restaurantsList3View, animated: true)

			case "SearchRestaurants1View":
				let searchRestaurants1View = SearchRestaurants1View()
				searchRestaurants1View.modalPresentationStyle = .fullScreen
				present(searchRestaurants1View, animated: true)

			case "SearchRestaurants2View":
				let searchRestaurants2View = SearchRestaurants2View()
				let navController = NavigationController(rootViewController: searchRestaurants2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Menu1View":
				let menu1View = Menu1View()
				navigationController?.pushViewController(menu1View, animated: true)

			case "Menu2View":
				let menu2View = Menu2View()
				navigationController?.pushViewController(menu2View, animated: true)

			case "Menu3View":
				let menu3View = Menu3View()
				navigationController?.pushViewController(menu3View, animated: true)

			case "Menu4View":
				let menu4View = Menu4View()
				navigationController?.pushViewController(menu4View, animated: true)

			case "DishView":
				let dishView = DishView()
				navigationController?.pushViewController(dishView, animated: true)

			case "FiltersView":
				let filtersView = FiltersView()
				navigationController?.pushViewController(filtersView, animated: true)

			case "SortByView":
				let sortByView = SortByView()
				present(sortByView, animated: true)

			default:
				break
		}
	}
}
