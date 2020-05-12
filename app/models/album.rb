class Album < ApplicationRecord
	belongs_to :user
	has_many :photos, :dependent => :destroy
	accepts_nested_attributes_for :photos	
	before_create :add_a_string_to_album_name

	private

	def add_a_string_to_album_name
	     #debugger
		self.write_attribute(:name,(self.name.to_s+" picture"))
		
		#self.save!
	end
end
