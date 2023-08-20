json.extract! import, :id, :filename, :size, :file_type, :status, :total_rows, :start_at, :finished_at, :meta, :created_at, :updated_at
json.url import_url(import, format: :json)
