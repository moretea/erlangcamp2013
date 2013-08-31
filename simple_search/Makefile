ERLC_OPTS=-Iinclude/
ERLC=erlc


all: src/reverse_index.beam src/simpel_search.beam

%.beam: %.erl
	${ERLC} ${ERLC_OPTS} $<
