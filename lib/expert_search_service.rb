class ExpertSearchService
  def self.find_user_matchings(member, term)
    # Search within none Friends and excluding the user self
    friends_id = member.friendships.pluck("friend_id")
    not_friends = Member.where.not(id: friends_id << member.id)

    # Searching matchings from friends of friend's documents by the term
    matchings = not_friends.joins(:headings).where('headings.content ILIKE ?', "%#{term}%").distinct

    # check if each matching have shared friends, return friends path if true, otherwise just return matching
    matchings_arr = []
    matchings.each do |expert|
      mutual_friends = member.friendships.pluck("friend_id") & expert.friendships.pluck("friend_id")
      if mutual_friends.present?
        mutual_friends.each do |mf|
          matchings_arr << [Member.find_by_id(mf), Member.find_by_id(expert)]
        end
      end
    end

    matchings_arr.present? ? matchings_arr : matchings
  end
end
