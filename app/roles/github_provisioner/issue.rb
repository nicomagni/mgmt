module GithubProvisioner

  class Issue < SimpleDelegator

    STATE_MAPPING = {
      "not_started" => "open",
      "started" => "open",
      "finished" => "open",
      "accepted" => "open",
      "rejected" => "open",
      "delivered" => "closed"
    }

    def initialize(github, issue)
      super(issue)
      @github = github
      @issue = issue
    end

    # Class Methods

    class << self

      def extract_attributes(github_issue)
        { 
          number: github_issue.number,
          github_status: github_issue.state,
          milestone_number: github_issue.milestone.number,
          created_at: github_issue.created_at,
          updated_at: github_issue.updated_at
        }
      end

    end

    # Instance Methods

    def sync_status!
      organization = AppConfiguration[:github].organization
      old_issue = ::Issue.find(@issue.id)
      new_state = STATE_MAPPING[@issue.status]
      if STATE_MAPPING[old_issue.status] != new_state
        @github.issues.edit(organization, @issue.project.name , @issue.number, "state" => new_state)
      end
    end

  end

end