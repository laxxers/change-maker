class Denomination < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 },
                    uniqueness: { case_sensitive: false }
  validates :value, presence: true, length: { maximum: 255 }, 
                    uniqueness: { case_sensitive: false }
end
