import SwiftUI
import SwiftData

import SwiftUI
import SwiftData

@main
struct ToDoList: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
