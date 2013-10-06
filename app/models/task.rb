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

  def self.add_parsed_tasks(tasks, email, task_date)
    user = User.where(email: email).first
    if user && email && task_date
      tasks.each do |task|
        user.tasks.create!(task_date: task_date, content: task)
      end
    end
  end

  private
    def parse_tags
      self.tag_list = content.scan /^#\w+/
    end
end
