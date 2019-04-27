class Recipe
  include HTTParty

  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "https://#{hostport}/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for term
    get('/search', query: { q: term })['recipes']
  end
end