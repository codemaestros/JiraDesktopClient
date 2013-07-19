require 'rubygems'
require 'jira'
require 'fileutils'
class Features
    USERNAME='yourJIRAusername'
    PASSWORD= 'yourJIRApassword!'
    URL= 'https://www.cws-cgicloud-apps.com:8443'
    FEATURE_DIRECTORY= 'Full Path to the Directory Where you would like to save the Feature file'
    EXTENSION='The extension you would like for the file'
  def self.jira
    @jira ||= JIRA::Client.new(credentials)
  end

  def self.credentials
     {
      :username => USERNAME,
      :password => PASSWORD, 
      :site => URL,
      :context_path => '',
      :auth_type => :basic

    }
  end

  def self.find_story_by(issuekey)
    if jira_credentials
      begin
        @issue ||= jira.Issue.find(issuekey) 
      rescue
        raise "Issue Not Found. Please enter a valid JIRA ID"
      end
    end

  end

  def self.test_cases_for(story)
    if story
        @test_cases ||= story.issuelinks.select { |i| i["type"]["name"] == "Test Case" }
        @tests ||= @test_cases.collect {|t| t["inwardIssue"]["key"] }
    else
      raise "User Story Not Found. Please enter a valid JIRA ID"
    end
  end

  def self.feature_file_for(issuekey)
    string = ''
    if story = find_story_by(issuekey)
      raise 'No test cases were related to the Issue ID provided' unless test_cases_for(story).any?
      string << <<-STORY
      FEATURE: #{story.summary} \n
      #{story.description} \n
      #{story.customfield_10116} \n \n \n
      STORY
      test_cases_for(story).each do |test_case_id|
        tc = jira.Issue.find(test_case_id)  rescue nil
        if tc
          string << <<-STRING
          #{tc.summary} \n
          #{tc.description}\n\n
          STRING
        end
      end
    end
    File.open("#{FEATURE_DIRECTORY}/#{issuekey}.#{EXTENSION}", 'w') { |f| f.write(string) }

  end

  def self.jira_credentials
    jira.Issuetype.all rescue raise "Invalid username and /or password"
  end
end

issuekey = ARGV[0]
file = Features.feature_file_for(issuekey)
puts "Your feature file has been saved as #{Features::FEATURE_DIRECTORY}/#{issuekey}.#{Features::EXTENSION}"

