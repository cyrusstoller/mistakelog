class Tag < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many :mistake_tags, class_name: "Relationships::MistakeTag", foreign_key: "tag_id", dependent: :destroy
  has_many :mistakes, through: :mistake_tags, source: :mistake

  scope :owned_by, ->(user_id){ where(user_id: user_id) }
  scope :search, ->(query){ where(self.arel_table[:name].matches("%#{query}%")) }

  def to_param
    name
  end
end
