class StartImportUserJob
  include Sidekiq::Job
  require 'csv'

  def perform(import_id)
    import = Import.find_by(id: import_id)
    nil unless import

    batch = Sidekiq::Batch.new
    batch.description = "Import User #{import_id}"
    batch.on(:completed, FinishImport, import_id:)
    batch.on(:success, FinishImport, import_id:)
    csv = CSV.parse(import.file.read, headers: true)&.map(&:to_h)
    batch.jobs do
      Sidekiq::Client.push_bulk('class' => ImportUserJob, 'args' => csv.map { |c| [c] })
      # csv.each do |row|
      # ImportUserJob.perform_async(row.to_json)
      # end
    end
  end
end
