package rules

import rego.v1

test_car_read_positive if {
	inp = {
		"method": "GET",
		"path": ["cars"],
		"user": "alice",
	}
	allow == true with input as inp
}

test_car_read_negative if {
	inp = {
		"method": "GET",
		"path": ["nonexistent"],
		"user": "alice",
	}
	allow == false with input as inp
}

test_car_create_negative if {
	inp = {
		"method": "POST",
		"path": ["cars"],
		"user": "alice",
	}
	allow == false with input as inp
}

test_car_create_positive if {
	inp = {
		"method": "POST",
		"path": ["cars"],
		"user": "charlie",
	}
	allow == true with input as inp
}

test_carid_read_negative if {
	inp = {
		"method": "GET",
		"path": ["cars", "id789-932"],
		"user": "ben",
	}
	allow == false with input as inp
}

test_carid_read_positive if {
	inp = {
		"method": "GET",
		"path": ["cars", "id789-932"],
		"user": "alice",
	}
	allow == true with input as inp
}
