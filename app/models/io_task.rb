class IoTask < ApplicationRecord
	# belongs_to :user, optional: true
	belongs_to :applyUser, class_name: "User",  foreign_key: "apply_user_id" , optional: true
	belongs_to :execUser, class_name: "User",  foreign_key: "exec_user_id" , optional: true

	has_many :ioTaskDet

end
