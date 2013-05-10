class Milestone < ActiveRecord::Base

  # Validations

  validates_presence_of :number
  # validates_presence_of :start_date
  validates_presence_of :due_date
  # validates_presence_of :estimated_hours
  # validates_presence_of :client_estimated_hours
  # validate :start_must_be_before_due_date
  # validate :estimated_hours_must_be_lower_than_client_estimated_hours

  # Associations

  belongs_to :project

  # Instance Methods

  # def start_must_be_before_due_date
  #   errors.add(:start_date, "must be before due date") unless self.start_date < self.due_date
  # end

  # def estimated_hours_must_be_lower_than_client_estimated_hours
  #   errors.add(:estimated_hours, "must be lower than client estimated hours") unless self.estimated_hours <= self.client_estimated_hours
  # end 

end
