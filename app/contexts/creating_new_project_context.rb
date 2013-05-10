# Public: A Context for creating new projects inside the Mgmt application.
# When a new project is created, all the actual issues are fetched from
# Github. Also webhooks subscription are created for the project's 
# Github repository events.
class CreatingNewProjectContext

  def initialize(options = {})
    @user = options[:user]
    @project_attributes = options[:project_attributes]
    @notifications_callback_url = options[:notifications_callback_url]
    @subscribe_to_events = options[:subscribe_to_events] || false
  end

  def create
    # TODO Make the project creation process atomically. Handle
    # external services failures.
    project = Project.create!(@project_attributes)
    provisioner = GithubProvisioner::Repository.new(@user.github, project)
    provisioner.provide_issues!
    provisioner.provide_milestones!
    if @subscribe_to_events
      subscriber = GithubEventsSubscriber.new(project, @user.token)
      subscriber.subscribe!(:issues, @notifications_callback_url)
    end
    project
  end

end