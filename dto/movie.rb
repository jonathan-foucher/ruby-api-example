class Movie
  attr_accessor :id, :title, :release_date

  def initialize(data)
    @id = data['id']
    @title = data['title']
    @release_date = data['release_date']
  end
end