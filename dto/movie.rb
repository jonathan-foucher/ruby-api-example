class Movie
  attr_accessor :id, :title, :release_date

  def initialize(data)
    @id = data['id']
    @title = data['title']
    @release_date = data['release_date']
  end

  def as_json(*)
    { id: @id, title: @title, release_date: @release_date }
  end

  def to_json(*)
    as_json.to_json()
  end
end
