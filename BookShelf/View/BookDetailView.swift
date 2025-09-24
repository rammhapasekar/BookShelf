//
//  BookDetailView.swift
//  BookShelf
//
//  Created by Ram Mhapasekar on 24/09/25.
//

import SwiftUI

struct BookDetailView: View {
  @Binding var book: Book
  @State var showEditBookView = false
    var body: some View {
      
      NavigationStack {
        Form {
          Text(book.title)
            .font(.headline)
            .foregroundColor(.red)
          Image(book.largeCoverImageName)
            .resizable()
            .scaledToFit()
            .shadow(radius: 10)
            .padding()
          Label(book.author, systemImage: "person.crop.rectangle")
          Label("ISBN: \(book.isbn)", systemImage: "number")
          Label("\(book.pages) pages", systemImage: "book")
          Toggle("Read", isOn: .constant(book.isRead))
          Button(action: {
            showEditBookView.toggle()
          }){
            Label("Edit", systemImage: "pencil")
          }
          Button(action: {}){
            Label("Share", systemImage: "square.and.arrow.up")
          }
        }
        .sheet(isPresented: $showEditBookView){
          BookEditView(book: $book)
        }
      .navigationTitle(book.title)
      }
    }
}

struct BookDetailView_Previews: PreviewProvider {
  @State static var book = Book.sampleBooks[0]
    static var previews: some View {
      BookDetailView(book: $book)
    }
}
