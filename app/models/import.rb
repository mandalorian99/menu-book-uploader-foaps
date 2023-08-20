class Import < ApplicationRecord
  ## Associations
  has_one_attached :file

  ## Enum
  enum :file_type, ['csv', 'xlxs', 'doc', 'txt', 'pdf']
  enum :status, [:started, :processing, :finished]

  ## Instance methods

  def file_url
    ActiveStorage::Current.url_options = Rails.application.credentials.fetch(:APP) # quik workround
    file.url
  end

end
