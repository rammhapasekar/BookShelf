# 📚 Bookshelf App

A simple and clean SwiftUI-based Bookshelf app that displays a list of books. Users can tap a book to view and edit its details.

- ✅ Built in **Swift 5**
- ✅ Uses **SwiftUI** with **MVVM architecture**
- ✅ Async handling with **Combine + async/await**

---

## ⚙️ Features

- 📖 View a list of books with titles and authors
- ✍️ Tap to view and edit book details
- 💾 Changes are saved locally (can be extended to use persistence)
- 🔄 Asynchronous data flow with Combine and Swift Concurrency

---

## 🧱 Architecture

This project follows the **MVVM (Model-View-ViewModel)** architecture:

- **Model**: Represents each book (`Book` struct)
- **ViewModel**: Handles the business logic and state using `@Published` 
- **View**: SwiftUI views like `BookListView` and `BookDetailView`

Data flow is reactive and supports cancellation using **Combine** and **Task cancellation** with `async/await`.

---

## 🔧 Requirements

- Xcode 14.0 or later
- iOS 16+
- Swift 5.7+

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/bookshelf-app.git
