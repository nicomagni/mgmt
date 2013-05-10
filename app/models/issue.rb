class Issue < ActiveRecord::Base
  
  STATUS = %w(
    not_started
    started
    finished
    accepted
    rejected
    delivered
  )
  ACTIONS = {
    "start" => "started",
    "finish" => "finished",
    "accept" => "accepted",
    "reject" => "rejected",
    "deliver" => "delivered" 
  }
  TYPE = %w(
    chore
    feature
    bug
  )

  # Validations

  validates_presence_of :number
  validates_presence_of :project
  validates :status, inclusion: { in: STATUS }
  validates :issue_type, inclusion: { in: TYPE }

  # Associations

  belongs_to :project
  has_many :worked_hours_entries

  # Instance Methods

  def worked_hours
    worked_hours_entries.reduce(0) { |sum, entry|  sum + entry.amount }
  end

end
