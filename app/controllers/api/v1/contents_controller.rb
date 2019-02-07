class Api::V1::ContentsController < ApplicationController

  api :GET, "/contents", "Find all Published content"
  formats ["json"]
  param :page, :number, desc: 'pagination'
  example <<-EOS
    [
        {
            "title": "Story Book",
            "published_date": "2019-02-07",
            "author": "Sahil",
            "summary": "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.",
            "content": "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old."
        }
    ]
  EOS
  def index
    json_response(Content.published.page(params[:page]))
  end

end
