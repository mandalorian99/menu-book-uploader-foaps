class Import < ApplicationRecord
  ## Associations
  has_one_attached :file

  ## Enum
  enum :file_type, ['csv', 'xlxs', 'doc', 'txt', 'pdf']
  enum :status, [:started, :processing, :finished, :aborted]

  ## Callbacks
  after_commit :broadcast_job_status

  ## Instance methods

  def file_url
    ActiveStorage::Current.url_options = Rails.application.credentials.fetch(:APP) # quik workround
    file.url
  end

  private
  
  ## Notify client about the status of job
  # Same can be enhanced to use with progess bar
  def broadcast_job_status
    Rails.logger.info "+++++broadcasting++++++++"
    broadcast_update_to(
      'jobstatus',
      target: 'job-status',
      html: "#{status_codes(status)}",
      target: "job-status-#{self.id}",
      locals: {
        status: self.status
      }
    )
  end

  def status_codes(key)
    {
      started: '🔵',
      processing: '🟠',
      finished: '🟢',
      aborted: '🔴'
    }.fetch(key.to_sym)
  end

end
