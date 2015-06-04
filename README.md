# GA WDI Project 2

[Spec details](https://gist.github.com/epoch/26528ddb95e2bcf52a49)

Heroku-hosted [app](https://wdiproject2.herokuapp.com/).

## Version history
1.0 - April 17, 2015 - End of project week
1.1 - April 21, 2015 - Book list filtering functionality added

## Incomplete content
- Filtering of the book list. [rectified in v1.1]
- Validation of genre, category & format (ie. one in each must be selected) when creating a new book.
- Ability to clear the filters back to their default values.

## User Stories
- I want to list all the books that I own, no matter the format
- I want to be able to filter the displayed list
- I want to be able to edit the details of each book in the  list
- I want to be able to flag if a book has been loaned to someone (and identify them)
- I want to be able to delete books from the list

## Positives I took out of this project
- Found gliffy to be a really useful wireframing tool, at least for my skill level and what I needed out of it
- Learnt and used the data attribute which was invaluable in passing ID values
- Improved my understanding of selection lists
- All CRUD elements one one page, with no refresh

## Struggles, and things to work on going forward
- Although I made some design notes at the outset (refer below), I was still 'fuzzy' on what I wanted the app to be and how to go about it. Having a clear vision of the app is needed, so as not to hinder the design & development process. 
- I couldn't get my list filter to work with multiple optional values.
- After initially feeling I had a good understanding of routes, I stumbled more times than I liked.
- Still frustrated by a lack of visual design talent.
- Get more comfortable with ActiveRecord syntax.

## Initial design notes

### Personal book catalogue

#### Allows a user to
- ADD a book entry (Create)
- VIEW all books, and filter based on selectable criteria (Read)
- EDIT a book entry (Update)
- REMOVE a book entry (Delete/Destroy)

#### Book details to be stored (minimum)
- ID (generated at creation time) (primary key)
- Title (mandatory)
- Author(s)
- Genre (eg. Biography, Fantasy, Text book)
- Category (ie. Fiction / Non-fiction)
- Format (ie. Hardback / Paperback / eBook)
- Loaned out to (person's name)

*Improvement?* Multiple genres allowed

##### Other book details that may be worth storing
- Cover image (either a locally stored image or via an api)
- Purchase price
- Number of pages
- Separation between standard p'back and trade p'back
- Series name (if book is part of a series)

#### Initial display
- List of books already in database (Title and Author only)
- Checkboxes to filter the book list, along with a **Filter** and **Clear Filters** button
- **New Book** button

#### UX/UI

##### Filtering the book list
- User selects/unselects checkboxes
- User clicks **Filter** button
- Book list is refreshed according to checkbox criteria

*Improvement?* Automatic filtering of the book list (ie. no need to click a button)

- Criteria:
  - Genre
  - Category
  - Format
  - Loaned to
- Checkboxes generated based on distinct db values in each column
- Ideally checkboxes can be hidden until needed

##### Adding a new book
- **New Book** button is clicked
- Current book list is hidden
- User presented with a form with input fields and a **Save** button
- User clicks **Save** button
  - validation: ensure the book title is not blank
- Form is hidden
- Full book list is displayed

*Improvement?* Current book list is refreshed and displayed, with existing filters applied

##### Viewing book details
- User clicks on book name
- Book details are displayed (drop down / accordian effect)
- **Edit**, **Delete** and **Close** buttons also shown

##### Editing book details
- User views book details
- User clicks **Edit** button
- Current book list is hidden
- User presented with a form with input fields and a **Save** button
  - fields populated with existing book details
- User clicks **Save** button
  - validation: ensure the book title is not blank
- Form is hidden
- Full book list is displayed

*Improvement?* Current book list is refreshed and displayed, with existing filters applied

##### Deleting book
- User views book details
- User clicks **Delete** button
- Confirmation pop-up displayed
- If user confirms book deletion:
  - form hidden
  - book removed from list

*Improvement?* Current book list is refreshed and displayed, with existing filters applied
