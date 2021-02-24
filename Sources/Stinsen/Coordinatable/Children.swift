import Foundation

///Container class for child coordinators. Usually you would initialize this without parameters.
public class Children: ObservableObject {
    #warning("TODO: Make this an enum maybe")
    @Published var activeChildCoordinator: AnyCoordinatable?
    @Published var activeModalChildCoordinator: AnyCoordinatable?
    
    public init(
        activeChildCoordinator: AnyCoordinatable? = nil,
        activeModalChildCoordinator: AnyCoordinatable? = nil
    ) {
        self.activeChildCoordinator = activeChildCoordinator
        self.activeModalChildCoordinator = activeModalChildCoordinator
    }
}

extension Children {
    /// Returns all active children to the coordinator in a non-specified order
    var allChildren: [AnyCoordinatable] {
        let children = [self.activeChildCoordinator, self.activeModalChildCoordinator].compactMap { $0 }
        
        return children + children.flatMap { $0.children.allChildren }
    }
    
    var allNonModalChildren: [AnyCoordinatable] {
        let children = [self.activeChildCoordinator].compactMap { $0 }
        
        return children + children.flatMap { $0.children.allNonModalChildren }
    }
    
    func containsChild<T: Coordinatable>(child: T) -> Bool {
        return allChildren.contains { coordinator -> Bool in
            coordinator.id == child.id
        }
    }
}
