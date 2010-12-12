class Photo < ActiveRecord::Base
  belongs_to :property
  has_attached_file :photo,
                    :styles => { :original => "400x400>", :thumb => "95x95>" },
                    :url  => "/assets/photos/:id/:style/basename.:extension",
                    :path => ":rails_root/public/assets/photos/:id/:style/basename.:extension"

  validates :feedback_id, :presence => true, :numericality => true
  
  validates_attachment_size :photo, :less_than => 3.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/pjpeg', 'image/png', 'image/gif']
end
