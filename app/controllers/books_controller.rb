class BooksController < ApplicationController
    
    def index
        @books = Book.all
        @book = Book.new
    end
        
    def new
        # @book = Book.new
    end
    
    def create
        book = Book.new(book_params)
        if book.save
           flash[:notice] = 'Your Impression was succesfully created!'
           redirect_to book_path(book)
        else
            @books = Book.all
            @book = book
            render('books/index')
        end
       
    end
    
    def show
       @book = Book.find(params[:id]) 
    end
    
    def edit
       @book = Book.find(params[:id])
    end
    
    def update
       book = Book.find(params[:id])
       if book.update(book_params)
           flash[:notice] = 'Your Impression was succesfully updated!'
           redirect_to book_path(book)
        else
            @book = book
            render('books/edit')
        end
    end
    
    def destroy
       book = Book.find(params[:id])
       if book.destroy
           flash[:notice] = 'Your Impression was succesfully deleted!'
           redirect_to books_path(book)
        else
            render('books')
        end
    end
    
    
    
    private
    
    def book_params
       params.require(:book).permit(:title, :body) 
    end
        
    
end
