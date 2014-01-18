module Civicaide

  def make_civic_client
    client = CivicAide::Client.new ENV["GOOGLE_API_KEY"]
  end

  def get_elections state, city
    client = self.make_civic_client
    users_elections = []
    elections = client.elections.all
    all_elections = elections["elections"]
    all_elections.find_all do |election|
      name = election.name
      id = election.id
      if /#{state}/.match(name) || /#{city}/.match(name)
        users_elections << id
      end
    end
  end

end