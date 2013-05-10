class Project < ActiveRecord::Base

  # Validations

  validates_presence_of :organization
  validates_presence_of :name

  # Associations

  has_many :issues
  has_many :teams
  has_many :users, through: :teams, uniq: true
  has_many :milestones
  accepts_nested_attributes_for :issues, allow_destroy: true

  # Class Methods

  def self.by_full_name(organization, name)
    Project.where(organization: organization, name: name).first
  end

  # Instance Methods

  def open_issues
    opened_issues = issues.where(github_status: :open).order("priority ASC")
    Issue::STATUS.flat_map do |status|
      opened_issues.select { |issue| issue.status == status }
    end
  end

  def current_milestone
    current_time = DateTime.now
    milestones.where("start_date <= ? AND due_date >= ?", current_time, current_time).first
  end

end
