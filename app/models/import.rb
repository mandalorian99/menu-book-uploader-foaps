class Import < ApplicationRecord
  ## Associations
  has_one_attached :file

  ## Enum
  enum :file_type, ['csv', 'xlxs', 'doc', 'txt', 'pdf']
  enum :status, [:started, :processing, :finished]

  ## Instance methods

#   def filename
#     File.basename(self.file)
#   end

end
