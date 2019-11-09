class IoTaskDet < ApplicationRecord
	belongs_to :io_task
	belongs_to :material, class_name: "Material", foreign_key: "material_id", optional: true
	belongs_to :product, class_name: "Product", foreign_key: "product_id", optional: true
end
