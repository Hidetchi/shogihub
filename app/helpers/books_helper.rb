module BooksHelper

  def book_title_tag(book)
    if (book.url == nil || book.url == "")
      book.title
    else
      link_to(book.title, book.url, :target => '_blank')
    end
  end
end
