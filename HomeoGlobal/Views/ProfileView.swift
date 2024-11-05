import SwiftUI

struct ProfileView: View {
    @State private var isSubscribed = false
    @State private var showAddChildSheet = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    Toggle("Premium Subscription", isOn: $isSubscribed)
                    Button("Add Child Profile") {
                        showAddChildSheet = true
                    }
                }
                
                Section(header: Text("Child Profiles")) {
                    Text("No children added yet")
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $showAddChildSheet) {
                AddChildView()
            }
        }
    }
}

struct AddChildView: View {
    @Environment(\.dismiss) var dismiss
    @State private var childName = ""
    @State private var birthDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Child's Name", text: $childName)
                DatePicker("Date of Birth", selection: $birthDate, displayedComponents: .date)
            }
            .navigationTitle("Add Child")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Save") {
                    // TODO: Save child profile
                    dismiss()
                }
            )
        }
    }
} 