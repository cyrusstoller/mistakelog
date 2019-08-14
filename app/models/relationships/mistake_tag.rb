class Relationships::MistakeTag < ApplicationRecord
  belongs_to :mistake, class_name: "Mistake", foreign_key: "mistake_id", optional: true
  belongs_to :tag, class_name: "Tag", foreign_key: "tag_id", optional: true,
    inverse_of: :mistake_tags, counter_cache: :cached_count
end
