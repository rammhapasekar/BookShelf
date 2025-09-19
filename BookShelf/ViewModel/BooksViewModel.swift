//
//  BooksViewModel.swift
//  BookShelf
//
//  Created by Ram Mhapasekar on 19/09/25.
//

import Foundation
import Combine

class BooksViewModel: ObservableObject{
  @Published private var originalBooks = Book.sampleBooks
  @Published var books = [Book]()
  @Published var fetching =  false
//  @Published var searchTerm: String = ""
//  
//  init() {
//    Publishers.CombineLatest($originalBooks, $searchTerm)
//      .map { books, searchTerm in
//        books.filter { book in
//          searchTerm.isEmpty ? true : (
//            book.title.matches(searchTerm) ||
//            book.author.matches(searchTerm)
//          )
//        }
//      }
//      .assign(to: &$books)
////      .sink { [weak self] value in
////          self?.books = value
////      }
//  }
  
  @MainActor
  func fetchData() async{
    fetching =  true
    do {
      try await Task.sleep(nanoseconds: 2_000_000_000)
      books =  Book.sampleBooks
      fetching = false
    } catch {
      print("Task was cancelled or failed: \(error)")
    }
  }
  
  private func generateNewBook() -> Book{
    let title = "New Book"
    let author = "New Author"
    let isbn = Int.random(in: 1000000000000...9999999999999)
    let pageCount = Int.random(in: 42...999)
    return Book(title: title, author: author, isbn: "\(isbn)", pages: pageCount)
  }
  
  @MainActor
  func refresh() async{
    do {
      try await Task.sleep(nanoseconds: 2_000_000_000)
      let book = generateNewBook()
      books.insert(book, at: 0)
      try await Task.sleep(nanoseconds: 5_000_000_000)
    } catch {
      print("Task was cancelled or failed: \(error)")
    }
  }
}
