module Civicaide

  def make_civic_client
    CivicAide::Client.new ENV["GOOGLE_API_KEY"]
  end

  def regions state
    us = Carmen::Country.named('United States')
    if state.size > 2
      the_state = state.downcase.capitalize!
      state_name = us.subregions.named the_state
      if state_name
        code = state_name.code
      end
    else
      code = state.upcase
    end
    code
  end

  def get_elections state, city
    client = self.make_civic_client
    state_code = regions state
    users_elections = []
    elections = client.elections.all
    all_elections = elections["elections"]
    all_elections.find_all do |election|
      name = election.name
      id = election.id
      date = election.election_day[0,4].to_i
      if date >= 2014
        p election.name
        if /#{state}/.match(name) || /#{state_code}/.match(name) || /#{city}/.match(name)
          users_elections << id
        end
      end
    end
    users_elections
  end

  def get_candidates state, city
    client = self.make_civic_client
    begin
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
  rescue CivicAide::Client::StandardError
  end

  def get_reps address
    client = self.make_civic_client
    begin
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
        oids = ids.map do |id|
          infos = officials.select do |oid, info|
            id.downcase == oid.downcase
          end
          id = infos.values_at(id.downcase)
        end
        facts = {}
        names = oids.map do |array|
          hash = array[0]
          hash.each do |k,v|
            facts[k] = v
          end
        end
        if info["level"] == "federal"
          federal[office] = names
        elsif info["level"] == "state"
          state[office] = names
        elsif info["level"] == "other"
          other[office] = names
        end
      end
      display_all << federal
      display_all << state
      display_all << other
      display_all
    end
    rescue CivicAide::Client::StandardError
  end

end