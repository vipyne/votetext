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
    users_elections
  end

  def get_candidates state, city
    client = self.make_civic_client
    ids = get_elections state, city
    candidates = {}
    ids.each do |id|
      # address hard code for now
      elec = client.election(id).at('810 Grand Street, Brooklyn, NY 11211')
      election_name = elec["election"]
      if election_name
        office = election_name["name"]
          if office
            office_title = office
          end
        end
      contests = elec["contests"]
      if contests
        names = contests[0]["candidates"]
          if names
          people = []
          names.each do |c|
            people << c.name
          end
            candidates[office_title] = people
        end
      end
    end
    candidates
  end

  #################################### FOR TESTING
  # def get_all_elections
  #   client = self.make_civic_client
  #   elections = client.elections.all
  #   all_elections = elections["elections"]
  #   # p "^"*50
  #   # p all_elections
  # end

  # def show_all_info ids
  #   client = self.make_civic_client
  #   # ids = get_all_elections
  #   ids.each do |e|
  #     elec = client.election(e.id).at('810 Grand Street, Brooklyn, NY 11211')
  #     p ""
  #     p "$TART #{e.id}: election"
  #     p elec["election"]["name"]
  #     con = elec["contests"]
  #     if con != nil
  #       p "! ~ #{e.id}: contest"
  #       p con[0]["office"] unless con[0]["office"] == nil
  #       candidates = con[0]["candidates"]
  #         if candidates != nil
  #         candidates.map do |c|
  #           p c.name
  #         end
  #       end
  #     end
  #     p "END$"
  #     p ""
  #   end
  # end

end