require_relative("models/ticket")
require_relative("models/film")
require_relative("models/customer")

require("pry-byebug")

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

  film1 = Film.new({
    "title" => "The Lord of the Rings: The Fellowship of the Ring",
    "price" => 4,
    "Year" => "2001"
  })
  film1.save()

  film2 = Film.new({
    "title" => "The Hitchhiker's Guide to the Galaxy",
    "price" => 9,
    "Year" => "2005"
  })
  film2.save()

  film3 = Film.new({
    "title" => "Harry Potter and the Half-Blood Prince",
    "price" => 7,
    "Year" => "2009"
  })
  film3.save()

  customer1 = Customer.new({
    "name" => "Dave",
    "funds" => 15
  })
  customer1.save()

  customer2 = Customer.new({
    "name" => "Bob",
    "funds" => 10
  })
  customer2.save()

  customer3 = Customer.new({
    "name" => "Fiona",
    "funds" => 20
  })
  customer3.save()

  ticket1 = Ticket.new({"showing_date" => "25/02/2020", "showing_time" => "19:00", "film_id" => film1.id, "customer_id" => customer1.id})
  ticket2 = Ticket.new({"showing_date" => "15/01/2020", "showing_time" => "15:00", "film_id" => film2.id, "customer_id" => customer2.id})
  ticket3 = Ticket.new({"showing_date" => "8/03/2020", "showing_time" => "10:00", "film_id" => film3.id, "customer_id" => customer3.id})
  ticket4 = Ticket.new({"showing_date" => "8/03/2020", "showing_time" => "10:00", "film_id" => film3.id, "customer_id" => customer2.id})
  ticket5 = Ticket.new({"showing_date" => "8/03/2020", "showing_time" => "10:00", "film_id" => film3.id, "customer_id" => customer1.id})
  ticket1.save()
  ticket2.save()
  ticket3.save()
  ticket4.save()
  ticket5.save()

  binding.pry
  nil
