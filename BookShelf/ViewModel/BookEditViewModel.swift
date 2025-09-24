//
//  BookEditViewModel.swift
//  BookShelf
//
//  Created by Ram Mhapasekar on 25/09/25.
//

import Foundation

class BookEditViewModel: ObservableObject{
  
  @Published var book: Book
  
  var isISBNValid: Bool {
    checkISBN(isbn: book.isbn)
  }
  
  init(book: Book) {
    self.book = book
  }
}
