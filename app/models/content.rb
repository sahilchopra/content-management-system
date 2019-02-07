class Content < ApplicationRecord
  enum status: [:draft, :published]

  before_update :save_publish_date
  after_create :publish_content

  def as_json(options={})
    {
      title: title,
      published_date: published_date,
      author: author,
      summary: summary,
      content: text
    }
  end

  private
  def save_publish_date
    if status_changed?
      self[:published_date] = (status == "published" ? Date.today : nil )
    end
  end
  
  def publish_content
    PublishContentWorker.perform_at(45.minutes.from_now, id)
  end
end





