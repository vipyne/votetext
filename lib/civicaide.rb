module Civicaide

  def make_civic_client
    client = CivicAide::Client.new ENV["GOOGLE_API_KEY"]
  end

  # def state_regex election_name state
  #   election_name =~ /state/
  # end

  def get_elections state, city
    client = self.make_civic_client
    users_elections = []
    elections = client.elections.all
    all_elections = elections["elections"]
    all_elections.find_all do |election|
      name = election.name
      id = election.id
      p name
      p state
      bah = /#{state}/.match(name)
      p bah
      if (/#{state}/.match(name) != nil) || (/#{city}/.match(name) != nil)

        users_elections << id
      end
    end
    p users_elections
  end

end