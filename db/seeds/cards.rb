if Rails.env.development?
	Card.create("period" => "daily", "limit" => 5, "min_range" => 50, "max_range" => 500, "type_user" => "Sender", "scratch_card_min" => 0, "scratch_card_max" => 10)
	Card.create("period" => "monthly", "limit" => 6, "min_range" => 500, "max_range" => 50000, "type_user" => "Sender", "scratch_card_min" => 0, "scratch_card_max" => 100)
	Card.create("period" => "yearly", "limit" => 7, "min_range" => 5000, "max_range" => 100000, "type_user" => "Sender", "scratch_card_min" => 0, "scratch_card_max" => 1000)
	Card.create("period" => "daily", "limit" => 3, "min_range" => 50, "max_range" => 500, "type_user" => "Receiver", "scratch_card_min" => 0, "scratch_card_max" => 10)
	Card.create("period" => "monthly", "limit" => 3, "min_range" => 500, "max_range" => 50000, "type_user" => "Receiver", "scratch_card_min" => 0, "scratch_card_max" => 100)
	Card.create("period" => "yearly", "limit" => 3, "min_range" => 5000, "max_range" => 100000, "type_user" => "Receiver", "scratch_card_min" => 0, "scratch_card_max" => 1000)
end