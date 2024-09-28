//
//  BooksManagementView.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI

struct BooksManagementView: View {
    @State private var showingAddBookSheet = false
    @State private var books = Book.sampleBooks

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Books Management")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: {
                    showingAddBookSheet.toggle()
                }) {
                    Label("Add Book", systemImage: "plus")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.trailing)
            }
            .padding(.top, 20)

            ScrollView {
                VStack(spacing: 15) {
                    ForEach(books) { book in
                        BookRow(book: book)
                            .padding(.horizontal, 20)
                    }
                }
                .padding(.top, 10)
            }
            
            Spacer()
        }
        .sheet(isPresented: $showingAddBookSheet) {
            AddBookView(books: $books)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}
struct BookRow: View {
    var book: Book
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Author: \(book.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct AddBookView: View {
    @Binding var books: [Book]
    @Environment(\.presentationMode) var presentationMode

    @State private var title = ""
    @State private var author = ""
    @State private var isValid = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                }
                
                Section {
                    Button(action: addBook) {
                        Text("Add Book")
                            .foregroundColor(.white)
                            .padding()
                            .background(isValid ? Color.accentColor : Color.gray)
                            .cornerRadius(8)
                    }
                    .disabled(!isValid)
                }
            }
            .navigationTitle("Add New Book")
            .onChange(of: title) { _ in validateForm() }
            .onChange(of: author) { _ in validateForm() }
        }
    }
    
    private func addBook() {
        let newBook = Book(id: UUID(), title: title, author: author)
        books.append(newBook)
        presentationMode.wrappedValue.dismiss()
    }
    
    private func validateForm() {
        isValid = !title.isEmpty && !author.isEmpty
    }
}
