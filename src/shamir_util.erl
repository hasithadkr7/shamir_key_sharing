%%%-------------------------------------------------------------------
%%% @author hasitha
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Feb 2023 12:17 AM
%%%-------------------------------------------------------------------
-module(shamir_util).

-include("shamir.hrl").

%% API
-export([encode_record/1, decode_binary/1]).

-spec encode_record(map()) -> binary().
encode_record(#share{threshold=Threshold, x=X, y=Y}) ->
  Map = #{<<"threshold">> => Threshold, <<"x_val">> => X, <<"y_val">> => Y},
  Json = jsx:encode(Map),
  base64:encode(Json).

-spec decode_binary(binary()) -> map().
decode_binary(Bin) ->
  Json = base64:decode(Bin),
  #{<<"threshold">> := Threshold, <<"x_val">> := X, <<"y_val">> := Y} = jsx:decode(Json),
  #share{threshold=Threshold, x=X, y=Y}.

