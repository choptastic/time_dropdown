# time_dropdown

A simple `#time_dropdown` element for the [Nitrogen Web
Framework](http://nitrogenproject.com)

## Installing into a Nitrogen Application

Add it as a rebar dependency by adding into the deps section of rebar.config:

```erlang
	{time_dropdown, "", {git, "git://github.com/choptastic/time_dropdown.git", {branch, master}}}
```

### Using Nitrogen's built-in plugin installer (Requires Nitrogen 2.2.0)

Run `make` in your Application. The rest should be automatic.

### Manual Installation (Nitrogen Pre-2.2.0)

Run the following at the command line:

```shell
	./rebar get-deps
	./rebar compile
```

Then add the following includes into any module requiring the form

```erlang
	-include_lib("time_dropdown/include/records.hrl").
```

## Usage

```erlang
	#time_dropdown{
		from="8am",
		to="5pm",
		interval=15,
		interval_type=minutes,
		format="g:i:sa",
		value="9:00am"
	}
```

+ `from`: The first time in the dropdown (Default: "12:00am")
+ `to`: The last time in the dropdown (Default: "11:59am")
+ `value`: The selected value in the dropdown. This time is intelligently
   compared, so that "9am" == "9:00"
+ `interval_type`: The granularity of interval (seconds, minutes, hours) (Default: `minutes`)
+ `interval`: How many `interval_type`s for each interval. (Default: 60)
+ `format`: The format to render each time. (Default: "g:ia")

## Note

Internally, this just uses [qdate](https://github.com/choptastic/qdate)'s
`range/4` function

## License

Copyright (c) 2016, [Jesse Gumm](http://jessegumm)
([@jessegumm](http://twitter.com/jessegumm))

MIT License
