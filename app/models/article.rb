class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list
		tags.join(", ")
	end
	
	def tag_list= tags_string
		tag_names = tags_string.split(",").collect do |s|
			s.string.downcase
		end.uniq

		self.tags = tag_names.collect do |tag_name|
			Tag.find_or_create_by name: tag_name
		end
	end
end
