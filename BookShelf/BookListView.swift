//
//  ContentView.swift
//  BookShelf
//
//  Created by Peter Friese on 11.09.22.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import SwiftUI

struct BookListView: View {
//  var books: [Book]
  @StateObject fileprivate var viewModel = BooksViewModel()
  var body: some View {
    NavigationStack {
      List($viewModel.books){ $book in
        BookRowView(book: $book)
      }.overlay{
        if viewModel.fetching{
          ProgressView("Fetching data, Please wait...")
            .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
        }
      }
      .animation(.default, value: viewModel.books)
      .task {
        await viewModel.fetchData()
      }
      .refreshable {
        await viewModel.refresh()
      }
      
      .listStyle(.plain)
      .navigationTitle("BookShelf")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    BookListView()
  }
}
