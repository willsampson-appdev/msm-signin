# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord

  validates(:title, { :presence => true })

  validates(:director_id, { :presence => true})

  has_many(:cast, { :class_name => "Character", :foreign_key => "movie_id", :dependent => :destroy })
  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "movie_id", :dependent => :destroy })
  belongs_to(:director, { :required => true, :class_name => "Director", :foreign_key => "director_id" })
  has_many(:actors, { :through => :cast, :source => :actor })
end
