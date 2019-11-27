class Continent < ApplicationRecord
	has_many :continents
	validates :name, presence: true
	validates :short_name, presence: true
end
