class Book < ApplicationRecord
	validates :book_title, presence:true,length:{ maximum: 30}
	validates :writer, presence:true
	validates :company, presence:true
	validates :price, presence:true
	class << self
		def search(query)
			rel = order("id")
			if query.present?
				rel = rel.where("book_title LIKE ?","%#{query}%")
			end
			rel
		end
	end
end
