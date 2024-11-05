import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                if searchText.isEmpty {
                    SearchPlaceholderView()
                } else {
                    SearchResultsView(searchText: searchText)
                }
            }
            .navigationTitle("Search Remedies")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search remedies or symptoms...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct SearchPlaceholderView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            Text("Search for remedies or symptoms")
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
}

struct SearchResultsView: View {
    let searchText: String
    
    var body: some View {
        List {
            Text("Results for: \(searchText)")
                .font(.headline)
        }
    }
} 