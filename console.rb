require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry')


    film1 = Film.new({
    'title'  => 'Dr ChickenFace: The Movie',
    'price' => '7000'
      })

    film1.save

    film2 = Film.new({
      'title'  => 'INNER JOIN II',
      'price' => '5000'
      })

    film2.save


    customer1 = Customer.new({
      'name'  => 'Jonathan O Jonathan',
      'funds' => '1000'
      })

    customer1.save

    customer2 = Customer.new({
      'name'  => 'Rt. Hon. Boaty McBoatface Jr. Esq.',
      'funds' => '10'
      })

    customer2.save


    ticket1 = Ticket.new({
      'customer_id' => customer1.id,
      'film_id'     => film1.id
      })

    ticket1.save

    ticket2 = Ticket.new({
      'customer_id' => customer2.id,
      'film_id'     => film2.id
      })

    ticket2.save

      ticket3 = Ticket.new({
        'customer_id' => customer1.id,
        'film_id'     => film2.id
        })

    ticket3.save

    ticket4 = Ticket.new({
        'customer_id' => customer2.id,
        'film_id'     => film1.id
      })

    ticket4.save













binding.pry
nil
