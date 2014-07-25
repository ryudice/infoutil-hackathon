namespace :populate_cities do

	task run: :environment do
		City.delete_all
		State.delete_all

		url_state = URI.parse("http://api.gobiernoabierto.gob.sv/states")
		req_state = Net::HTTP::Get.new(url_state.path)
		req_state.add_field('Authorization',"Token token=\"ac8881e48eb015025da314ebd6c75d13\"")

		res = Net::HTTP.new(url_state.host,url_state.port).start do |http|
			http.request(req_state)
		end

		JSON.parse(res.body).each do |state|

			s = State.create(name: state["name"] )
			

			uricity = "http://api.gobiernoabierto.gob.sv/cities?q[state_id_eq]=s_id"
			uricity["s_id"] = state["id"].to_s
			url_city = URI.parse(uricity)
			req_city = Net::HTTP::Get.new(uricity)
			req_city.add_field('Authorization',"Token token=\"ac8881e48eb015025da314ebd6c75d13\"")

			res_city = Net::HTTP.new(url_city.host,url_city.port).start do |http|
				http.request(req_city)
			end

			JSON.parse(res_city.body).each do |city|
				s.cities.create(name: city["name"])
			end

			s.save
		end


	end
end