class Activity < ActiveRecord::Base

  has_one :photo
  has_one :place
  accepts_nested_attributes_for :photo, :allow_destroy => true
  accepts_nested_attributes_for :place
  
  def find_all_by_current_user
    return find_all_by_user_id(@user.id)
  end

end
