class ImportMenuJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Rails.logger.debug "+++++++++++++++STARTING IMPORTER++++++++++++++"
  end
end
