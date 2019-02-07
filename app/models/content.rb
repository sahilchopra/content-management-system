class Content < ApplicationRecord
  enum status: [:draft, :published]

  def as_json(options={})
    {
      title: title,
      published_date: published_date,
      author: author,
      summary: summary,
      content: text
    }
  end
end





