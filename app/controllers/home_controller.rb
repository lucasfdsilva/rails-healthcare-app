class HomeController < ApplicationController
  def index
		#Invoking Covid 19 Figures API using my custom gem for making http calls
		url = 'https://covid-193.p.rapidapi.com/statistics'
		@covidResponse = HttpLucas.get(url, {}, {
			'Content-Type' => 'application/json',
			'x-rapidapi-key' => '4a676d2b21msh5dd238b250b6e52p1ef36bjsncafc3a26696d',
			'x-rapidapi-host' => 'covid-193.p.rapidapi.com'
		})

		@covidData = JSON.parse(@covidResponse.body)
		@sortedCovidData = @covidData["response"].sort_by { |hash| hash["cases"]["total"] }.reverse

		#Invoking bing's news API using my custom gem for making http calls
		url = 'https://bing-news-search1.p.rapidapi.com/news'
		newsResponse = HttpLucas.get(url, {}, {
			'Content-Type' => 'application/json',
			'x-rapidapi-key' => '4a676d2b21msh5dd238b250b6e52p1ef36bjsncafc3a26696d',
			'x-rapidapi-host' => 'bing-news-search1.p.rapidapi.com'})

		@newsData = JSON.parse(newsResponse.body)
  end

  def about
  end

end
