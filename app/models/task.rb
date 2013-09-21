# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  task_date  :date
#  content    :text
#  duration   :integer          default(0)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  validate :task_date, :content, presence: true

  before_save :parse_tags

  private
    def parse_tags
      self.tag_list = content.scan /^#\w+/
    end
end
