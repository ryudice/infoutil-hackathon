namespace :populate_estado do
	task run: :environment do
		Estado.delete_all
		Estado.create(name: 'Recibido')
		Estado.create(name: 'Pendiente')
		Estado.create(name: 'Completado')
	end

end
