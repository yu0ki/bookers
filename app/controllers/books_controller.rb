class BooksController < ApplicationController
    
    # 一覧ページの表示に関するアクション。
    # 投稿一覧を表示するためのインスタンス変数@booksと
    # 新規投稿を作成する際に必要なインスタンス変数@bookを
    # 
    
    def index
        @books = Book.all
        @book = Book.new
    end
    
    
    # indexで必要な分は書いたので、個々では特に何も定義しない。
    def new
        # @book = Book.new
    end
    
    
    # 新規作成されたデータを保存する
    # 保存が成功した場合はサクセスメッセージを、
    # 失敗した場合はエラーメッセージを表示する
    
    def create
        book = Book.new(book_params)
        if book.save
           flash[:notice] = 'Your Impression was successfully created!'
           redirect_to book_path(book)
        else
            @books = Book.all
            @book = book
            render('books/index')
        end
    end
    
    
    # 各陶工の詳細ページを表示する
    def show
       @book = Book.find(params[:id]) 
    end
    
    
    # 各陶工の編集ページを表示する
    def edit
       @book = Book.find(params[:id])
    end
    
    
    # 各投稿を編集した場合に、そのデータを保存する
    # 分岐処理はcreateとほぼ同じ
    def update
       book = Book.find(params[:id])
        if book.update(book_params)
           flash[:notice] = 'Your Impression was successfully updated!'
           redirect_to book_path(book)
        else
            @book = book
            render('books/edit')
        end
    end
    
    
    # 投稿を削除するアクション
    # 削除成功・失敗時の分岐はcreateなどとほぼ同じ
    def destroy
       book = Book.find(params[:id])
        if book.destroy
           flash[:notice] = 'Your Impression was successfully deleted!'
           redirect_to books_path(book)
        else
            @books = Book.all
            render('books')
        end
    end
    
    
    # ストロングパラメータの定義
    private
    
    def book_params
       params.require(:book).permit(:title, :body) 
    end
        
    
end
