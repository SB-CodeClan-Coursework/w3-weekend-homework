require_relative('models/ticket')
require_relative('models/customer')
require_relative('models/film')

require('pry')


  film1 = Film.new({
    'name'  => 'Dr ChickenFace: The Movie'
    'price' => '7000'
      })

    film2 = Film.new({
      'name'  => 'INNER JOIN II'
      'price' => '5000'
      })


    customer1 = Customer.new({
      'name'  => 'Jonathan O Jonathan'
      'funds' => '1000'
      })

    customer2 = Customer.new({
      'name'  => 'Rt. Hon. Boaty McBoatface Jr. Esq.'
      'funds' => '10'
        })












binding.pry
nil
