import Foundation
import SwiftUI

import Stinsen

final class HomeCoordinator: NavigationCoordinatable {
    lazy var navigationStack = NavigationStack(self)

    enum Route {

    }
    
    func resolveRoute(route: Route) -> Transition {

    }
    
    @ViewBuilder func start() -> some View {
        HomeScreen()
    }
}
