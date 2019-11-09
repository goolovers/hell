module PCodesHelper
	def codeName(type_code,code)
		pcode = PCode.find_by_type_code_and_code(type_code,code)
		pcode == nil ? "" : pcode.name
	end

	def getPCodes(type_code)
		PCode.where(type_code: type_code)
	end

	def name_with_unit(name,nuit="个")
		"#{name} (#{nuit})"
	end
end
