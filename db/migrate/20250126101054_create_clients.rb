class CreateClients < ActiveRecord::Migration[7.2]
  def change
  	create_table :clients do |t| # create_table это создать таблицу
  		t.text :name # t.text это тип поля 
  		t.text :phone # :phone это имя столбца
  		t.text :datestamp
  		t.text :barber
  		t.text :color

  		t.timestamps
  	end
  end
end
