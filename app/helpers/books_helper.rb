module BooksHelper

  def book_title_tag(book, external_mark = nil)
    if (book.url == nil || book.url == "")
      book.title
    elsif external_mark
      link_to(book.title, book.url, :target => '_blank', :class => 'external')
    else
      link_to(book.title, book.url, :target => '_blank')
    end
  end
end
