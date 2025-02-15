package com.data;

import java.util.HashMap;
import java.util.Map;

import com.model.Book;

public class BookDB {

	 private static Map<String, Book> books = new HashMap<>();

	    public static void addBook(Book book) {
	        books.put(book.getISBN(), book);
	    }

	    public static boolean isBook(String isbn) {
	        return books.containsKey(isbn);
	    }

	    public static Book findBook(String isbn) {
	        return books.get(isbn);
	    }

	    public static void deleteBook(String isbn) {
	        books.remove(isbn);
	    }

	    public static Map<String, Book> getBooks() {
	        return books;
	    }

	    public static void editBook(Book book) {
	        books.put(book.getISBN(), book);
	    }

	    public static void decrement(String isbn) {
	        Book book = findBook(isbn);
	        if (book != null) {
	            book.decriment();;
	        }
	    }

	    public static void increment(String isbn) {
	        Book book = findBook(isbn);
	        if (book != null) {
	            book.incriment();
	        }
	    }
}
