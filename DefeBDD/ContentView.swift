import SwiftUI

struct ContentView: View {
    @State private var selectedDatabase = "tp2" // Default database
    @State private var user = ""
    @State private var authtoken = "" // Default authtoken
    @State private var query = "SELECT *"
    @State private var apiResponse: String = ""
    
    let baseURL = "https://germand.tplinkdns.com/database/"

    var body: some View {
        VStack {
            Picker("Select Database", selection: $selectedDatabase) {
                Text("tp2").tag("tp2")
                Text("Club").tag("Club")
            }
            .pickerStyle(.menu)
            .padding()

            TextField("User (Optional)", text: $user)
                .padding()
            
            TextField("Authtoken", text: $authtoken)
                .padding()
            
            TextField("Query", text: $query)
                .padding()
            
            Button("Fetch Data") {
                fetchData()
            }
            
            Text(apiResponse)
                .padding()
        }
    }
    
    func fetchData() {
        // URL Encoding for query
        
        // Building URL
        var urlComponents = URLComponents(string: baseURL + selectedDatabase)! // Force unwrap is ok here since baseURL is valid
        urlComponents.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "authtoken", value: authtoken.lowercased()),
        ]

        // Add user if provided
        if !user.isEmpty {
            urlComponents.queryItems?.append(URLQueryItem(name: "user", value: user.lowercased()))
        }

        guard let url = urlComponents.url else {
            apiResponse = "Invalid URL"
            return
        }

        // Fetching data
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    apiResponse = "Error: \(error)"
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    apiResponse = "No data received"
                }
                return
            }

            if let jsonString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    apiResponse = jsonString
                }
            } else {
                DispatchQueue.main.async {
                    apiResponse = "Error converting data to string"
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
