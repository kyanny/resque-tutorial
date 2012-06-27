class Bookmark < ActiveRecord::Base
  attr_accessible :comment, :title, :url
end
