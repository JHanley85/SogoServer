require "open-uri"
class Asset < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :data_file_name
  validates_uniqueness_of :data_file_name
  attr_accessible :data

  IMAGE_SETTINGS={
   :original => ['1024x1024>'],
   :medium=> ['256x256>'],
   :small=> ['128x128>'],
   :thumb=>['100x100>']
  }

  has_attached_file :data, :styles=>Asset::IMAGE_SETTINGS, :url=>"/uploads/:id.jpg?style=:style"

  def self.from_url(url)
    self.create( :data =>open(url))
  end

end

