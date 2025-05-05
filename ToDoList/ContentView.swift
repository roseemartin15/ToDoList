import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        VStack {
            HStack {
            Text("To Do List")
                     .font(.system(size: 40))
                     .fontWeight(.black)
                Spacer()
                Button
                    {
                    showNewTask = true
                    } label: {
                        Text ("+")
                }
            }
            .padding()

            Spacer()

            List {
                ForEach(toDos)
                { toDoItem in
                if toDoItem.isImportant
                {
                Text("‼️" + toDoItem.title)
                } else
                    {
                    Text(toDoItem.title)
                    
                    }
                }
                .onDelete(perform: deleteToDo)
            }
           

            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: " ", isImportant: false))
            }
        }
    }

    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}


