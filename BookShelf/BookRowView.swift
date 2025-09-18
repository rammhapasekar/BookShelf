//
//  BookRowView.swift
//  BookShelf
//
//  Created by Ram Mhapasekar on 16/09/25.
//

import SwiftUI

struct BookRowView: View {
  @Binding var book: Book
  var body: some View {
    HStack(alignment: .top){
      Image(book.mediumCoverImageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 90)
      VStack(alignment: .leading){
        HStack{
          Text(book.title)
            .font(.headline)
          Spacer()
         
            Button(action: {
              book.isFavourite.toggle()
            }) {
              if book.isFavourite{
                Image(systemName: "heart.fill")
                  .foregroundColor(.pink)
                  .font(.title)
              }
              else{
                Image(systemName: "heart")
                  .foregroundColor(.secondary)
                  .font(.title)
            }
          }
        }
        
        Text("by \(book.author)")
          .font(.subheadline)
        HStack{
          Text("\(book.pages) pages")
            .font(.subheadline)
            .foregroundColor(.secondary)
          Spacer()
          Text("ISBN: \(book.isbn)")
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        
      }
      Spacer()
    }
  }
}

struct BookRowView_Previews: PreviewProvider {
  @State static var book = Book.sampleBooks[0]
    static var previews: some View {
      BookRowView(book: $book)
    }
}
