require "open-uri"
class Asset < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :data_file_name
  #validates_uniqueness_of :data_file_name
  attr_accessible :data

  IMAGE_SETTINGS={
   :original => ['1024x1024>'],
   :medium=> ['256x256>'],
   :small=> ['128x128>'],
   :thumb=>['100x100>']
  }

  has_attached_file :data, :styles=>{
      :original => ['1024x1024>'],
      :medium=> ['256x256>'],
      :small=> ['128x128>'],
      :thumb=>['100x100#']
  },
            :url => "../assets/users/:user_id/:id_:basename_:id" + ".:extension",
            :path => ":rails_root/app/assets/images/users/:user_id/:id_:style_:basename" + ".:extension"

  def self.from_url(url)
    self.create( :data =>open(url))
  end

end

