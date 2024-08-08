class ExportUserJob
  include Sidekiq::Job
  require 'csv'

  def perform(report_id)
    report = Report.find_by(id: report_id)
    return unless report
    return if report.completed?

    file_csv = Tempfile.new(["export_user_#{Time.now.to_i}", '.csv']).tap do |file|
      CSV.open(file, 'wb') do |csv|
        csv << User.column_names - %w[created_at updated_at]

        User.find_each do |user|
          csv << user.attributes.values_at(*User.column_names - %w[created_at updated_at])
        end
      end
    end
    report.file_attacher.assign(file_csv)
    report.completed!
  end
end
