//
//  BookRowView.swift
//  BookShelf
//
//  Created by Ram Mhapasekar on 16/09/25.
//

import SwiftUI

struct BookRowView: View {
  var book: Book
  var body: some View {
    HStack(alignment: .top){
      Image(book.mediumCoverImageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 90)
      VStack{
        Text(book.title)
          .font(.headline)
        Text("by \(book.author)")
          .font(.subheadline)
        Text("\(book.pages) pages")
          .font(.subheadline)
      }
      Spacer()
    }
  }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
      BookRowView(book: Book.sampleBooks[0])
    }
}
