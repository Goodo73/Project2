# Personal book catalogue

## Allows a user to
- ADD a book entry (Create)
- VIEW books based on selectable criteria (Read)
- EDIT a book entry (Update)
- REMOVE a book entry (Delete/Destroy)

## Book details to be stored (minimum)
- ID (generated at creation time) (primary key)
- Title (mandatory)
- Author(s)
- Genre (eg. Biography, Fantasy, Text book)
  - multiple values allowed
- Classification (ie. Fiction / Non-fiction)
- Format (ie. Hardback / Paperback / eBook)
- Loaned out to (person's name)

### Other book details that may be worth storing
- Cover image (either a locally stored image or via an api)
- Purchase price
- Number of pages
- Separation between standard p'back and trade p'back

## Initial display
- List of books already in database
- Checkboxes to filter the book list, along with a **Filter** and **Clear Filters** button
- **New Book** button

## UX/UI

### Filtering the book list
- User selects/unselects checkboxes
- User clicks **Filter** button
- Book list is refreshed according to checkbox criteria

*Improvement?* Automatic filtering of the book list (ie. no need to click a button)

### Adding a new book
- **New Book** button is clicked
- Current book list is hidden
- User presented with a form with input fields and a **Save** button
- User clicks **Save** button
  - validation: ensure the book title is not blank
- Form is hidden
- Full book list is displayed

*Improvement?* Current book list is refreshed and displayed, with existing filters applied

### Viewing book details
- User clicks on book name
- Book details are displayed (drop down / accordian effect)
- **Edit**, **Delete** and **Close** buttons also shown

### Editing book details
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

### Deleting book
- User views book details
- User clicks **Delete** button
- Confirmation pop-up displayed
- If user confirms book deletion:
  - form hidden
  - book removed from list

*Improvement?* Current book list is refreshed and displayed, with existing filters applied
