%% vim: ft=nitrogen
-module (element_time_dropdown).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
		reflect/0,
		transform_element/1
	]).

-spec reflect() -> [atom()].
reflect() -> record_info(fields, time_dropdown).

-spec transform_element(#time_dropdown{}) -> #dropdown{}.
transform_element(R = #time_dropdown{from=From, to=To, value=Value0,
                        interval=Interval, interval_type=Type, format=Format}) ->

	DD = wf_utils:copy_fields(R, #dropdown{}),
    Options = make_options(From, To, Interval, Type, Format),
    Value = try qdate:to_string(Format, Value0)
            catch _:_ -> ""
            end,
	DD#dropdown{value=Value, options=Options}.

make_options(From, To, Interval, Type, Format) ->
    Range = qdate:range(Type, Interval, From, To),
    lists:map(fun(T) ->
        Formatted = qdate:to_string(Format, T),
        #option{text=Formatted, value=Formatted}
    end, Range).
