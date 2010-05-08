class Photo < ActiveRecord::Base

  belongs_to :activity
  
  has_attached_file :pic,
  :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :medium => "350x350>",
    :large =>   "600x600>" }

  validates_attachment_presence :pic
  validates_attachment_size :pic, :less_than => 10.megabytes
end
