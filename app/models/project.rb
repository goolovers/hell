class Project < ApplicationRecord
	has_many :projectMaterials
	has_many :projectProducts
end
