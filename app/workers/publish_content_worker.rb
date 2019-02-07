class PublishContentWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(id)
    Content.find(id).update_attributes(status: :published)
  end
end
