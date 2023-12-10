@icon("res://icons/sequence.png")
extends Task

# All children must run successfully

class_name Sequence

var current_child = 0

func run():
	get_child(current_child).run()
	running()

func child_success():
	current_child += 1
	if current_child >= get_child_count():
		current_child = 0
		success()

func child_fail():
	current_child = 0
	fail()

func cancel():
	current_child = 0
	super.cancel()

func start():
	current_child = 0
	super.start()
