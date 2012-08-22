%% @author Marc Worrell <marc@worrell.nl>
%% @copyright 2012 Marc Worrell

%% Copyright 2012 Marc Worrell
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(filter_survey_prepare_thurstone).

-export([
    survey_prepare_thurstone/2
]).

survey_prepare_thurstone(Blk, Context) ->
    Answers = z_trans:lookup_fallback(
                    proplists:get_value(answers, Blk, <<>>), 
                    Context),
    Qs1 = split_markers(split_lines(Answers)),
    [
        {answers, Qs1}
    ].

split_lines(Text) ->
    Options = string:tokens(z_string:trim(z_convert:to_list(Text)), "\n"),
    [ z_string:trim(Option) || Option <- Options ].

split_markers(Qs) ->
    [ split_marker(Opt) || Opt <- Qs, Opt /= [] ].

split_marker(X) ->
    case lists:splitwith(fun(C) -> C /= $# end, X) of
        {Opt, []} -> {z_convert:to_binary(Opt), z_convert:to_binary(Opt)};
        {Opt, [$#|Rest]} -> {z_convert:to_binary(Opt), z_convert:to_binary(Rest)}
    end.
