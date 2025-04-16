🛍️ Flutter Product List App

This is a simple Flutter application that fetches and displays a list of products using the Fake Store API. It demonstrates how to:
•	Fetch data from a REST API using the http package
•	Decode JSON data into Dart models
•	Use FutureBuilder to handle asynchronous data
•	Display a list of products using ListView.builder
•	Implement clean and maintainable UI with proper state management

🚀 Features
•	Displays product title, price, and image
•	Async data loading with a loading indicator
•	Error handling for failed requests
•	Scalable architecture for future enhancements

📦 Packages Used
•	http - for making HTTP requests
•	flutter - for UI components and layout

lib/
├── model/
│   └── products.dart    // Product data model
├── pages/
│   └── product_list_page.dart  // Main UI logic
