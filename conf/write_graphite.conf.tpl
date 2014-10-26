LoadPlugin write_graphite

<Plugin write_graphite>
	<Node "Carbon">
		Host "{{ GRAPHITE_HOST }}"
		Port "{{ GRAPHITE_PORT }}"
#		Prefix "collectd"
#		Postfix "collectd"
#		StoreRates false
#		AlwaysAppendDS false
#		EscapeCharacter "_"
	</Node>
</Plugin>
