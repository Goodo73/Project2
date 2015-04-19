$(document).ready(function(){
	// Book title clicked in book listing
	$('#books-list').on('click', 'li', function(){
		var $bookId = $(this).data('book-id');

		var apiBook = {
			url: '/api/books/' + $bookId,
			dataType: 'json'
		};
		$.ajax(apiBook).done(function(book) {
			displayBook(book,$bookId);
		})
	})

	// Filter button clicked
	$('#filterBtn').on('click', function(event){
		if (
			($('#filter-genre').val() === null) &&
			($('#filter-category').val() === null) &&
			($('#filter-format').val() === null) &&
			($('#filter-loan').val() === null)
			) {
				event.preventDefault();
			// No filtering criteria has been set, so do nothing
		} else {
			filterBookList();
		}
	})

	// New button clicked while editing book details
	$('.addBtn').on('click',function(){
		// Clear input fields
		$('#form-title').val('');
		$('#form-author').val('');
		$('#form-genre').val('none');
		$('#form-category').val('none');
		$('#form-format').val('none');
		$('#form-loaned_to').val('');
		$('#book-display').hide();
		$('#book-form').show();

		// Set Save button's book-id to 0 to flag we are saving a new entry
		$('.saveBtn').data('book-id','0');
	})

	// Save button clicked while editing book details
	$('.saveBtn').on('click',function(event){
		event.preventDefault();
		var $bookId = $(this).data('book-id');

		if ($bookId === '0') {
		// Saving a new entry
			var saveUrl = '/books/add';
			var saveMethod = 'post';
		} else {
		// Saving an existing entry
			var saveUrl = '/books/' + $bookId;
			var saveMethod = 'put';
		}

		var saveBook = {
			url: saveUrl,
			method: saveMethod,
			data: {
				title: $('#form-title').val(),
				author: $('#form-author').val(),
				genre: $('#form-genre').val(),
				category: $('#form-category').val(),
				format: $('#form-format').val(),
				loan: $('#form-loaned_to').val()
			}
		};
		$.ajax(saveBook).done(function(book) {
			displayBook(book,book.id);

			// Load book list
			var apiBooks = {
				url: '/api/books',
				dataType: 'json'
			};
			$.ajax(apiBooks).done(function(books) {
				displayBooks(books)
			})
		})
	})

	// Edit button clicked while viewing book details
	$('.editBtn').on('click',function(){
		var $bookId = $(this).data('book-id');
		var apiBook = {
			url: '/api/books/' + $bookId,
			dataType: 'json'
		};
		$.ajax(apiBook).done(function(book) {
			$('#form-title').val(book.title);
			$('#form-author').val(book.author);
			$('#form-genre').val(book.genre.name);
			$('#form-category').val(book.category.name);
			$('#form-format').val(book.format.name);
			$('#form-loaned_to').val(book.loaned_to);

			$('#book-display').hide();
			$('#book-form').show();
		})
	})

	// Delete button clicked while viewing book details
	$('.delBtn').on('click', function(){
		var $bookId = $(this).data('book-id');

		var deleteBook = {
			url: '/books/' + $bookId + '/delete',
			method: 'delete',
		};
		$.ajax(deleteBook).done(function(book) {
			$('#book-form').hide();
			$('#book-display').hide();

			// Load book list
			var apiBooks = {
				url: '/api/books',
				dataType: 'json'
			};
			$.ajax(apiBooks).done(function(books) {
				displayBooks(books)
			})
		})
	})

	// Set the filtering criteria and make an AJAX call
	function filterBookList() {
		if ($('#filter-genre').val() === null) {
			var filtGenre = '';
		} else {
			var filtGenre = $('#filter-genre').val();
		}

		if ($('#filter-category').val() === null) {
			var filtCategory = '';
		} else {
			var filtCategory = $('#filter-category').val();
		}

		if ($('#filter-format').val() === null) {
			var filtFormat = '';
		} else {
			var filtFormat = $('#filter-format').val();
		}

		if ($('#filter-loan').val() === null) {
			var filtLoan = '';
		} else {
			var filtLoan = $('#filter-loan').val();
		}
		var apiBook = {
			url: '/api/books/filter',
			dataType: 'json',
			data: {
				genre: filtGenre,
				category: filtCategory,
				format: filtFormat,
				loan: filtLoan
			}
		};
		$.ajax(apiBook).done(function(books) {
			displayBooks(books);

			$('#book-display').hide();
			$('#book-form').hide();
		})
	}

	// Display the details of a single book
	function displayBook(book,bookID) {
		$('#book-display h2').html(book.title);
		$('#book-display h3').html(book.author);
		$('#book-display #genre').html(book.genre.name);
		$('#book-display #category').html(book.category.name);
		$('#book-display #format').html(book.format.name);
		$('#book-display #loaned_to').html(book.loaned_to);

		// Save the id of the selected book to buttons (for future referencing)
		$('.editBtn').data('book-id', bookID);
		$('.delBtn').data('book-id', bookID);
		$('.saveBtn').data('book-id', bookID);

		$('#book-form').hide();
		$('#book-display').show();
	}

	// Display a list of books 
	function displayBooks(books) {
		$('#books-list ul').empty();
		
		for (var i = 0; i < books.length; i++) {
			var $listItem = $('<li>').html("<strong>" + books[i].title + "</strong> by " + books[i].author);
			$listItem.attr('data-book-id', books[i].id);
			$('#books-list ul').append($listItem);
		}
	}
});
