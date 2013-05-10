module GithubProvisioner

  module Milestone

    class << self

      def extract_attributes(github_milestone)
        { 
          number: github_milestone.number,
          due_date: github_milestone.due_on,
          created_at: github_milestone.created_at
        }
      end

    end

  end

end