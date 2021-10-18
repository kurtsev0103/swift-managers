# SwiftManagers
## Description

Swift managers package for the easiness of working with the various services.

- [FirebaseAuth](https://github.com/kurtsev0103/swift-managers/releases/download/1.0.0/FirebaseAuth.zip) - Manager to handle Firebase authentication.
- [FirebaseStorage](https://github.com/kurtsev0103/swift-managers/releases/download/1.0.0/FirebaseStorage.zip) - Manager for using Firebase Storage cloud storage.
- [FirebaseFirestore](https://github.com/kurtsev0103/swift-managers/releases/download/1.0.0/FirebaseFirestore.zip) - Manager for using the Firebase Firestore cloud database.
- [NetworkingAlamofire](https://github.com/kurtsev0103/swift-managers/releases/download/1.0.0/NetworkingAlamofire.zip) - Network Manager for dispatching URL Requests based on [Alamofire](https://github.com/Alamofire/Alamofire).
- [NetworkingURLSession](https://github.com/kurtsev0103/swift-managers/releases/download/1.0.0/NetworkingURLSession.zip) - Network Manager for dispatching URL Requests based on URLSession.

## Installation
Just [Download](https://github.com/kurtsev0103/swift-managers/releases) the folder of the desired manager, unzip and copy files to your project.

## Samples and Example Usage

### FirebaseAuth
``` swift
AuthManager.shared.login(email: "email", password: "pass") { result in
    switch result {
    case .success(let user):
        print(user.providerID)
    case .failure(let error):
        print(error.localizedDescription)
    }
}

AuthManager.shared.register(email: "email", password: "pass", confirmPassword: "pass") { result in
    switch result {
    case .success(let user):
        print(user.providerID)
    case .failure(let error):
        print(error.localizedDescription)
    }
}

AuthManager.shared.resetPassword(email: "email") { result in
    switch result {
    case .success(_):
        print("success")
    case .failure(let error):
        print(error.localizedDescription)
    }
}

AuthManager.shared.logout()
```

### FirebaseStorage
``` swift
let userImage = UIImage() // <- Here should be the image you want to upload.
let id = "USER_ID" // <- Here you must specify the ID of the user you want to download from.

StorageManager.shared.upload(userPhoto: userImage, userId: id) { (result) in
    switch result {
    case .success(let url):
        print(url.absoluteString)
    case .failure(let error):
        print(error.localizedDescription)
    }
}
```

``` swift
guard let url = URL(string: "URL_STRING_TO_IMAGE") else { return }

StorageManager.shared.downloadImage(url: url) { (result) in
    switch result {
    case .success(let image):
        print("success")
    case .failure(let error):
        print(error.localizedDescription)
    }
    
}
```

### FirebaseFirestore
``` swift
let user = Auth.auth().currentUser! // <- There must be a class User object here.
 // For example when you get a user in the response after registering Firebase.

FirestoreManager.shared.getUserData(user: user) { (result) in
    switch result {
    case .success(let firestoreUserModel):
        print(firestoreUserModel.firstName)
    case .failure(let error):
        print(error.localizedDescription)
    }
}
```

``` swift
let user = FirestoreUserModel() // <- There must be a class FirestoreUserModel object here.
// For example when you get a user in the response after registering Firebase.

FirestoreManager.shared.saveProfile(user: user, userImage: nil) { (result) in
    switch result {
    case .success(let firestoreUserModel):
        print(firestoreUserModel.firstName)
    case .failure(let error):
        print(error.localizedDescription)
    }
}
```

### NetworkingAlamofire

- First create a request method in the ```NetworkManager.swift``` file.

``` swift
func exampleRequest(completion: @escaping (Result<Data?, Error>) -> Void) {
    guard let url = URL(string: "API_URL_STRING") else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    // If the request contains headers.
    let headers = ["EXAMPLE_API_HEADER_KEY" : "EXAMPLE_API_HEADER_VALUE",
                   "EXAMPLE_API_HEADER_KEY" : "EXAMPLE_API_HEADER_VALUE"]
    request.allHTTPHeaderFields = headers
    
    // If the request contains parameters.
    let params = ["EXAMPLE_API_PARAMS_KEY" : "EXAMPLE_API_PARAMS_VALUE",
                  "EXAMPLE_API_PARAMS_KEY" : "EXAMPLE_API_PARAMS_VALUE"]
    let data = try? JSONSerialization.data(withJSONObject: params, options: [])
    request.httpBody = data
    
    AF.request(request).responseJSON { (response) in
        switch response.result {
        case .success(_):
            completion(.success(response.data))
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
```

- After, you will be able to call anywhere with a short request.

``` swift
NetworkManager.shared.exampleRequest { result in
    switch result {
    case .success(let data):
        print("success")
    case .failure(let error):
        print(error.localizedDescription)
    }
}
```

- Additionally, you can parse the received date to your class object. 

    - Create a model based on the query response in the file ```ExampleModel.swift```
    - Sign all structures to protocol ```Codable``` <- REQUIRED.
    - See example in the file ```ExampleModel.swift```

``` swift
guard let data = data else { return }
if let object = NetworkHelpers.shared.parseExampleModel(data) {
    print(object.name)
}
```

### NetworkingURLSession

- First create a request method in the ```DataFetcherManager.swift``` file.

``` swift
func exampleRequest(completion: @escaping (ExampleModel?) -> Void) {
    let urlString = "API_URL_STRING"
    dataFetcher.fetchJSONData(urlString: urlString, headers: nil, response: completion)
}
```

- Create a model based on the query response in the file ```ExampleModel.swift```
- Sign all structures to protocol ```Codable``` <- REQUIRED.

``` swift
struct ExampleModel: Codable {
    let main: Main
    let name: String
}

struct Main: Codable {
    let firstValue: Double
    let secondValue: Double
}
```

- After, you will be able to call anywhere with a short request.

``` swift
var dataFetcherManager = DataFetcherManager()

dataFetcherManager.exampleRequest { exampleModel in
    guard let exampleModel = exampleModel else { return }
    print(exampleModel.name)
}
```

## Created by Oleksandr Kurtsev (Copyright © 2021) [LICENSE](https://github.com/kurtsev0103/SwiftManagers/blob/main/LICENSE)
