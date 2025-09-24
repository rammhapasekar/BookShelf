//
//  BookEditView.swift
//  BookShelf
//
//  Created by Ram Mhapasekar on 24/09/25.
//

import SwiftUI

struct BookEditView: View {
  @FocusState private var textfieldIsFocused: Bool
  @Binding var book: Book
  @ObservedObject var bookEditViewModel: BookEditViewModel
  @Environment(\.dismiss) var dismiss
  
  func cancel(){
    dismiss()
  }
  
  func save(){
    self.book = bookEditViewModel.book
    dismiss()
  }
  
  init(book: Binding<Book>) {
    self._book = book
    self.bookEditViewModel = BookEditViewModel(book: book.wrappedValue)
  }
  
  var body: some View {
    Form {
      TextField("Book title", text: $bookEditViewModel.book.title)
      //        .focused($textfieldIsFocused)
      Image(bookEditViewModel.book.largeCoverImageName)
        .resizable()
        .scaledToFit()
        .shadow(radius: 10)
        .padding()
      TextField("Author", text: $bookEditViewModel.book.author)
      //        .focused($textfieldIsFocused)
      TextField("Pages",value: $bookEditViewModel.book.pages, formatter: NumberFormatter())
        .keyboardType(.numberPad)
        .focused($textfieldIsFocused)
      VStack(alignment: .leading){
        if !bookEditViewModel.isISBNValid{
          Text("ISBN is invalid")
            .font(.caption)
            .foregroundColor(.red)
        }
        TextField("ISBN", text: $bookEditViewModel.book.isbn)
      }
      Toggle("Read", isOn: .constant(bookEditViewModel.book.isRead))
    }
    .navigationTitle(bookEditViewModel.book.title)
    .toolbar{
      ToolbarItem(placement: .navigationBarLeading){
        Button(action: cancel){
          Text("Cancel")
        }
      }
      
      ToolbarItem(placement: .navigationBarLeading){
        Button(action: save){
          Text("Save")
        }
      }
      
      ToolbarItem(placement: .keyboard){
        if textfieldIsFocused{
          Button("Done"){
            textfieldIsFocused = false
          }
        }
      }
    }
  }
}

struct BookEditView_Previews: PreviewProvider {
  @State static var book = Book.sampleBooks[0]
  static var previews: some View {
    BookEditView(book: $book)
  }
}
