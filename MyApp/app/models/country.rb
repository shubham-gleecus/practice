class Country < ApplicationRecord
	has_many :countries
	validates :name, presence: true
	validates :code, presence: true
end
