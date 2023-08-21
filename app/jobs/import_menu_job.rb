require 'csv'

class ImportMenuJob < ApplicationJob
  queue_as :default

  def perform(import)
    Rails.logger.debug "+++++++++++++++STARTING IMPORTER++++++++++++++"
    menu_itmes = []
    blob = import.file

    begin
      blob.open do |file|
        csv = CSV.read(file, headers: true)
        row_count = csv.size
        import.update(status: 'processing', total_rows: row_count)
        csv.each_with_index do |row, index|
          Rails.logger.info "==> uploading: #{calc_progress(index, row_count)} %"
          menu_itmes << { name: row['dish_name'], description: row['dish_description'], dish_type: row['dish_type'], allergens: row['allergens'], category: row['Category'], price: row['Price'] }
          Menu.insert_all(menu_itmes)
        end
      end
    rescue StandardError => e
      meta = {"error": e.message, "backtrace": e.backtrace }
      import.update(status: 'aborted', finished_at: DateTime.now, meta: meta)
      return
    end

    sleep(5)
    import.update(status: 'finished', finished_at: DateTime.now)
    Rails.logger.info "+++++++++++++Imported #{menu_itmes.count} items succesully out of #{import.total_rows}"
  end


  private

  def calc_progress(progress, total_rows)
    ((progress.to_f/total_rows) * 100).to_i
  end
end
