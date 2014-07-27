namespace :populate_asaltos do

	task run: :environment do
		Asalto.delete_all

		Asalto.create(location: [13.685173, -89.239616])


	end
end
