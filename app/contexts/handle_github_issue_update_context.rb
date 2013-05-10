class HandleGithubIssueUpdateContext

  def initialize(github, issue)
    @github = github
    @issue = issue
  end

  def handle_issue
    raise ArgumentError, "Project cannot be nil" unless @issue
    # issue = Issue.find(@issue.id)
    # check if changed...
    GithubProvisioner::Issue.new(@github, @issue).sync_status!
    @issue.save!
  rescue
    false
  end


end