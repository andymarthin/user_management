class ImportUserJob
  include Sidekiq::Job

  def perform(params)
    # user_params = JSON.parse(params)
    user = User.new params
    user.save
  end
end
