module Salesforce
  def self.host
    SALESFORCE_CONFIG["host"]
  end
  def self.username
    SALESFORCE_CONFIG["username"]
  end
  def self.password
    SALESFORCE_CONFIG["password"]
  end
  def self.client_id
    SALESFORCE_CONFIG["client_id"]
  end
  def self.client_secret
    SALESFORCE_CONFIG["client_secret"]
  end

  def self.client
    client = Databasedotcom::Client.new host: self.host, client_id: self.client_id, client_secret: self.client_secret
    client.authenticate username: self.username, password: self.password
    client
  end

  def self.all_pages(collection)
    return collection unless collection.next_page?
    current_page = collection
    all_pages = []
    all_pages += current_page
    while current_page.next_page?
      current_page = current_page.next_page
      all_pages += current_page
    end
    all_pages
  end
end