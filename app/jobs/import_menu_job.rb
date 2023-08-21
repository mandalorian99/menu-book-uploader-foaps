require 'csv'

class ImportMenuJob < ApplicationJob
  queue_as :default

  def perform(import)
    Rails.logger.debug "+++++++++++++++STARTING IMPORTER++++++++++++++"
    blob = import.file

    begin
      blob.open do |file|
        csv = CSV.read(file, headers: true)
        row_count = csv.size
        import.update(status: 'processing', total_rows: row_count)
        csv.each_with_index do |row, index|
          ## parse csv and insert into db 
        end
      end
    rescue StandardError => e
      meta = {"error": e.message, "backtrace": e.backtrace }
      import.update(status: 'aborted', finished_at: DateTime.now, meta: meta)
      return
    end

    import.update(status: 'finished', finished_at: DateTime.now)

  end


  private

  def calc_progress(progress, total_rows)
    ((progress.to_f/total_rows) * 100).to_i
  end
end
