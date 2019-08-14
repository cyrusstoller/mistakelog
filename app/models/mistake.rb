class Mistake < ApplicationRecord
  extend FriendlyId

  friendly_id :id_str, use: :slugged

  validates_presence_of :description
  before_validation :process_text
  before_validation :add_reminder_date

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many :mistake_tags, class_name: "Relationships::MistakeTag", foreign_key: "mistake_id", dependent: :destroy
  has_many :tags, through: :mistake_tags, source: :tag

  scope :incomplete, ->{ where(reflection: nil).or(where(reflection: '')) }
  scope :complete, ->{ where.not(reflection: nil).where.not(reflection: '')}
  scope :overdue, ->{ where(self.arel_table[:reminder_date].lt(Date.current)) }

  def set_tags(*tag_names)
    potential_tag_names = tag_names.uniq
    current_tags = tags.to_a
    current_tag_names = current_tags.map(&:name)
    new_tags = []

    # create new tags
    new_tag_names = potential_tag_names - current_tag_names
    new_tag_names.each do |name|
      tag = user.tags.find_by(name: name)
      tag ||= Tag.create(user_id: self.user_id, name: name)
      new_tags << tag
    end

    new_tags += current_tags.select do |tag|
      potential_tag_names.include?(tag.name)
    end

    self.tags = new_tags
  end

  def overdue?
    reminder_date < Date.current
  end

  def incomplete?
    reflection.blank?
  end

  def self.rating_selection
    [
      ["1 - small", 1],
      ["2", 2],
      ["3", 3],
      ["4", 4],
      ["5", 5],
      ["6", 6],
      ["7", 7],
      ["8", 8],
      ["9", 9],
      ["10 - large", 10]
    ]
  end

  private

  def id_str
    SecureRandom.urlsafe_base64(10)
  end

  def process_text
    tas_description = TagAnalyzerService.new(description)
    tas_reflection = TagAnalyzerService.new(reflection)

    self.processed_description = tas_description.analyze
    self.processed_reflection = tas_reflection.analyze

    relevant_tags = tas_description.tags + tas_reflection.tags
    set_tags *relevant_tags
  end

  def add_reminder_date
    if reminder_date.blank? && reflection.blank?
      self.reminder_date = Date.current + 2.weeks
    end
  end
end
