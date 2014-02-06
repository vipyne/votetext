module Civicaide

  def make_civic_client
    CivicAide::Client.new ENV["GOOGLE_API_KEY"]
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
    users_elections
  end

  def get_candidates state, city
    client = self.make_civic_client
    ids = get_elections state, city
    election_dates = {}
    ids.each do |id|
      # address hard code for now
      elec = client.election(id).at('810 Grand, Brooklyn, NY 11211')
      election_name = elec["election"]
      if election_name
        office = election_name["name"]
        if office
          office_title = office
        end
        date = election_name["election_day"]
        if date
          election_day = date
        end
      end
      contests = elec["contests"]
      election_dates[election_day] = office_title
    end
    election_dates
  end

  def get_reps address
    client = self.make_civic_client
    reps = client.representatives.at address
    offices = reps["offices"]
    officials = reps["officials"]
    display_all = []
    federal = {}
    state = {}
    other = {}
    offices.each do |office_id, info|
      office = info["name"]
      ids = info["official_ids"]
        grr = ids.map do |id|
          infos = officials.select do |oid, info|
            id.downcase == oid.downcase
          end
          id = infos.values_at(id.downcase)
        end
        bah = grr.map { |n| n[0]["name"] }
      if info["level"] == "federal"
        federal[office] = bah
      elsif info["level"] == "state"
        state[office] = bah
      elsif info["level"] == "other"
        other[office] = bah
      end
    end
    display_all << federal
    display_all << state
    display_all << other
    display_all
  end

end