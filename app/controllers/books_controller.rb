class BooksController < ApplicationController
	def index
		@books=Book.order("id")
	end

	def show
		@book=Book.find(params[:id])
	end

	def new
		@book=Book.new
	end

	def edit
		@book=Book.find(params[:id])
	end

	def create
		@book=Book.new(params[:book])
		if @book.save
			redirect_to @book,notice:"書籍情報を登録しました"
		else
			render "new"
		end
	end

	def update
		@book=Book.find(params[:id])
		@book.assign_attributes(params[:book])
		if @book.save
			redirect_to @book,notice:"書籍情報を更新しました"
		else
			render "edit"
		end
	end

	def destroy
		@book=Book.find(params[:id])
		@book.destroy
		redirect_to :books,notice:"書籍情報を更新しました"
	end

	def search
		@books=Book.search(params[:q])
		render "index"
	end
end

