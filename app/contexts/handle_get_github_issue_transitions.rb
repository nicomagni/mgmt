class HandleGetGithubIssueTransitions

  TRANSITIONS = {
    "not_started" => ["start"],
    "started" => ["finish"],
    "finished" => ["accept", "reject"],
    "accepted" => ["deliver"],
    "rejected" => ["start"],
    "delivered" => []
  }

  def initialize(issue)
    @issue = issue
  end

  def get_transitions
    TRANSITIONS[@issue.status]
  end