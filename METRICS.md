```bash
# HELP coredns_build_info A metric with a constant '1' value labeled by version, revision, and goversion from which CoreDNS was built.
# TYPE coredns_build_info gauge
coredns_build_info{goversion="go1.12.2",revision="e3f9a80",version="1.5.0"} 1
# HELP coredns_cache_hits_total The count of cache hits.
# TYPE coredns_cache_hits_total counter
coredns_cache_hits_total{server="dns://:53",type="success"} 10
# HELP coredns_cache_misses_total The count of cache misses.
# TYPE coredns_cache_misses_total counter
coredns_cache_misses_total{server="dns://:53"} 3
# HELP coredns_cache_size The number of elements in the cache.
# TYPE coredns_cache_size gauge
coredns_cache_size{server="dns://:53",type="denial"} 1
coredns_cache_size{server="dns://:53",type="success"} 1
# HELP coredns_dns_request_count_total Counter of DNS requests made per zone, protocol and family.
# TYPE coredns_dns_request_count_total counter
coredns_dns_request_count_total{family="1",proto="udp",server="dns://:53",zone="."} 13
# HELP coredns_dns_request_duration_seconds Histogram of the time (in seconds) each request took.
# TYPE coredns_dns_request_duration_seconds histogram
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.00025"} 10
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.0005"} 10
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.001"} 10
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.002"} 12
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.004"} 12
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.008"} 12
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.016"} 13
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.032"} 13
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.064"} 13
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.128"} 13
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.256"} 13
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="0.512"} 13
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="1.024"} 13
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="2.048"} 13
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="4.096"} 13
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="8.192"} 13
coredns_dns_request_duration_seconds_bucket{server="dns://:53",zone=".",le="+Inf"} 13
coredns_dns_request_duration_seconds_sum{server="dns://:53",zone="."} 0.014245284999999998
coredns_dns_request_duration_seconds_count{server="dns://:53",zone="."} 13
# HELP coredns_dns_request_size_bytes Size of the EDNS0 UDP buffer in bytes (64K for TCP).
# TYPE coredns_dns_request_size_bytes histogram
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="0"} 0
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="100"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="200"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="300"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="400"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="511"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="1023"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="2047"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="4095"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="8291"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="16000"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="32000"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="48000"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="64000"} 13
coredns_dns_request_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="+Inf"} 13
coredns_dns_request_size_bytes_sum{proto="udp",server="dns://:53",zone="."} 393
coredns_dns_request_size_bytes_count{proto="udp",server="dns://:53",zone="."} 13
# HELP coredns_dns_request_type_count_total Counter of DNS requests per type, per zone.
# TYPE coredns_dns_request_type_count_total counter
coredns_dns_request_type_count_total{server="dns://:53",type="A",zone="."} 12
coredns_dns_request_type_count_total{server="dns://:53",type="other",zone="."} 1
# HELP coredns_dns_response_rcode_count_total Counter of response status codes.
# TYPE coredns_dns_response_rcode_count_total counter
coredns_dns_response_rcode_count_total{rcode="NOERROR",server="dns://:53",zone="."} 12
coredns_dns_response_rcode_count_total{rcode="NXDOMAIN",server="dns://:53",zone="."} 1
# HELP coredns_dns_response_size_bytes Size of the returned response in bytes.
# TYPE coredns_dns_response_size_bytes histogram
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="0"} 0
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="100"} 12
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="200"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="300"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="400"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="511"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="1023"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="2047"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="4095"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="8291"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="16000"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="32000"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="48000"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="64000"} 13
coredns_dns_response_size_bytes_bucket{proto="udp",server="dns://:53",zone=".",le="+Inf"} 13
coredns_dns_response_size_bytes_sum{proto="udp",server="dns://:53",zone="."} 780
coredns_dns_response_size_bytes_count{proto="udp",server="dns://:53",zone="."} 13
# HELP coredns_forward_request_count_total Counter of requests made per upstream.
# TYPE coredns_forward_request_count_total counter
coredns_forward_request_count_total{to="172.31.0.2:53"} 3
# HELP coredns_forward_request_duration_seconds Histogram of the time each request took.
# TYPE coredns_forward_request_duration_seconds histogram
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.00025"} 0
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.0005"} 0
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.001"} 0
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.002"} 2
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.004"} 2
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.008"} 2
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.016"} 3
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.032"} 3
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.064"} 3
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.128"} 3
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.256"} 3
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="0.512"} 3
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="1.024"} 3
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="2.048"} 3
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="4.096"} 3
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="8.192"} 3
coredns_forward_request_duration_seconds_bucket{to="172.31.0.2:53",le="+Inf"} 3
coredns_forward_request_duration_seconds_sum{to="172.31.0.2:53"} 0.010821509
coredns_forward_request_duration_seconds_count{to="172.31.0.2:53"} 3
# HELP coredns_forward_response_rcode_count_total Counter of requests made per upstream.
# TYPE coredns_forward_response_rcode_count_total counter
coredns_forward_response_rcode_count_total{rcode="NOERROR",to="172.31.0.2:53"} 2
coredns_forward_response_rcode_count_total{rcode="NXDOMAIN",to="172.31.0.2:53"} 1
# HELP coredns_forward_sockets_open Gauge of open sockets per upstream.
# TYPE coredns_forward_sockets_open gauge
coredns_forward_sockets_open{to="172.31.0.2:53"} 1
# HELP coredns_health_request_duration_seconds Histogram of the time (in seconds) each request took.
# TYPE coredns_health_request_duration_seconds histogram
coredns_health_request_duration_seconds_bucket{le="0.00025"} 0
coredns_health_request_duration_seconds_bucket{le="0.0005"} 126861
coredns_health_request_duration_seconds_bucket{le="0.001"} 155060
coredns_health_request_duration_seconds_bucket{le="0.002"} 155123
coredns_health_request_duration_seconds_bucket{le="0.004"} 155139
coredns_health_request_duration_seconds_bucket{le="0.008"} 155151
coredns_health_request_duration_seconds_bucket{le="0.016"} 155154
coredns_health_request_duration_seconds_bucket{le="0.032"} 155154
coredns_health_request_duration_seconds_bucket{le="0.064"} 155154
coredns_health_request_duration_seconds_bucket{le="0.128"} 155154
coredns_health_request_duration_seconds_bucket{le="0.256"} 155154
coredns_health_request_duration_seconds_bucket{le="0.512"} 155154
coredns_health_request_duration_seconds_bucket{le="1.024"} 155154
coredns_health_request_duration_seconds_bucket{le="2.048"} 155154
coredns_health_request_duration_seconds_bucket{le="4.096"} 155154
coredns_health_request_duration_seconds_bucket{le="8.192"} 155154
coredns_health_request_duration_seconds_bucket{le="+Inf"} 155154
coredns_health_request_duration_seconds_sum 65.25095931499939
coredns_health_request_duration_seconds_count 155154
# HELP coredns_panic_count_total A metrics that counts the number of panics.
# TYPE coredns_panic_count_total counter
coredns_panic_count_total 0
# HELP coredns_plugin_enabled A metric that indicates whether a plugin is enabled on per server and zone basis.
# TYPE coredns_plugin_enabled gauge
coredns_plugin_enabled{name="cache",server="dns://:53",zone="."} 1
coredns_plugin_enabled{name="errors",server="dns://:53",zone="."} 1
coredns_plugin_enabled{name="forward",server="dns://:53",zone="."} 1
coredns_plugin_enabled{name="loadbalance",server="dns://:53",zone="."} 1
coredns_plugin_enabled{name="loop",server="dns://:53",zone="."} 1
coredns_plugin_enabled{name="prometheus",server="dns://:53",zone="."} 1
# HELP go_gc_duration_seconds A summary of the GC invocation durations.
# TYPE go_gc_duration_seconds summary
go_gc_duration_seconds{quantile="0"} 7.61e-06
go_gc_duration_seconds{quantile="0.25"} 1.688e-05
go_gc_duration_seconds{quantile="0.5"} 3.106e-05
go_gc_duration_seconds{quantile="0.75"} 4.0469e-05
go_gc_duration_seconds{quantile="1"} 8.8051e-05
go_gc_duration_seconds_sum 0.042206709
go_gc_duration_seconds_count 1299
# HELP go_goroutines Number of goroutines that currently exist.
# TYPE go_goroutines gauge
go_goroutines 20
# HELP go_info Information about the Go environment.
# TYPE go_info gauge
go_info{version="go1.12.2"} 1
# HELP go_memstats_alloc_bytes Number of bytes allocated and still in use.
# TYPE go_memstats_alloc_bytes gauge
go_memstats_alloc_bytes 2.119424e+06
# HELP go_memstats_alloc_bytes_total Total number of bytes allocated, even if freed.
# TYPE go_memstats_alloc_bytes_total counter
go_memstats_alloc_bytes_total 2.92904364e+09
# HELP go_memstats_buck_hash_sys_bytes Number of bytes used by the profiling bucket hash table.
# TYPE go_memstats_buck_hash_sys_bytes gauge
go_memstats_buck_hash_sys_bytes 1.483156e+06
# HELP go_memstats_frees_total Total number of frees.
# TYPE go_memstats_frees_total counter
go_memstats_frees_total 2.3192975e+07
# HELP go_memstats_gc_cpu_fraction The fraction of this program's available CPU time used by the GC since the program started.
# TYPE go_memstats_gc_cpu_fraction gauge
go_memstats_gc_cpu_fraction 1.4932040210789615e-06
# HELP go_memstats_gc_sys_bytes Number of bytes used for garbage collection system metadata.
# TYPE go_memstats_gc_sys_bytes gauge
go_memstats_gc_sys_bytes 2.38592e+06
# HELP go_memstats_heap_alloc_bytes Number of heap bytes allocated and still in use.
# TYPE go_memstats_heap_alloc_bytes gauge
go_memstats_heap_alloc_bytes 2.119424e+06
# HELP go_memstats_heap_idle_bytes Number of heap bytes waiting to be used.
# TYPE go_memstats_heap_idle_bytes gauge
go_memstats_heap_idle_bytes 6.2808064e+07
# HELP go_memstats_heap_inuse_bytes Number of heap bytes that are in use.
# TYPE go_memstats_heap_inuse_bytes gauge
go_memstats_heap_inuse_bytes 3.579904e+06
# HELP go_memstats_heap_objects Number of allocated objects.
# TYPE go_memstats_heap_objects gauge
go_memstats_heap_objects 12619
# HELP go_memstats_heap_released_bytes Number of heap bytes released to OS.
# TYPE go_memstats_heap_released_bytes gauge
go_memstats_heap_released_bytes 6.1227008e+07
# HELP go_memstats_heap_sys_bytes Number of heap bytes obtained from system.
# TYPE go_memstats_heap_sys_bytes gauge
go_memstats_heap_sys_bytes 6.6387968e+07
# HELP go_memstats_last_gc_time_seconds Number of seconds since 1970 of last garbage collection.
# TYPE go_memstats_last_gc_time_seconds gauge
go_memstats_last_gc_time_seconds 1.5608810664046216e+09
# HELP go_memstats_lookups_total Total number of pointer lookups.
# TYPE go_memstats_lookups_total counter
go_memstats_lookups_total 0
# HELP go_memstats_mallocs_total Total number of mallocs.
# TYPE go_memstats_mallocs_total counter
go_memstats_mallocs_total 2.3205594e+07
# HELP go_memstats_mcache_inuse_bytes Number of bytes in use by mcache structures.
# TYPE go_memstats_mcache_inuse_bytes gauge
go_memstats_mcache_inuse_bytes 3472
# HELP go_memstats_mcache_sys_bytes Number of bytes used for mcache structures obtained from system.
# TYPE go_memstats_mcache_sys_bytes gauge
go_memstats_mcache_sys_bytes 16384
# HELP go_memstats_mspan_inuse_bytes Number of bytes in use by mspan structures.
# TYPE go_memstats_mspan_inuse_bytes gauge
go_memstats_mspan_inuse_bytes 58032
# HELP go_memstats_mspan_sys_bytes Number of bytes used for mspan structures obtained from system.
# TYPE go_memstats_mspan_sys_bytes gauge
go_memstats_mspan_sys_bytes 98304
# HELP go_memstats_next_gc_bytes Number of heap bytes when next garbage collection will take place.
# TYPE go_memstats_next_gc_bytes gauge
go_memstats_next_gc_bytes 4.194304e+06
# HELP go_memstats_other_sys_bytes Number of bytes used for other system allocations.
# TYPE go_memstats_other_sys_bytes gauge
go_memstats_other_sys_bytes 669540
# HELP go_memstats_stack_inuse_bytes Number of bytes in use by the stack allocator.
# TYPE go_memstats_stack_inuse_bytes gauge
go_memstats_stack_inuse_bytes 720896
# HELP go_memstats_stack_sys_bytes Number of bytes obtained from system for stack allocator.
# TYPE go_memstats_stack_sys_bytes gauge
go_memstats_stack_sys_bytes 720896
# HELP go_memstats_sys_bytes Number of bytes obtained from system.
# TYPE go_memstats_sys_bytes gauge
go_memstats_sys_bytes 7.1762168e+07
# HELP go_threads Number of OS threads created.
# TYPE go_threads gauge
go_threads 10
# HELP process_cpu_seconds_total Total user and system CPU time spent in seconds.
# TYPE process_cpu_seconds_total counter
process_cpu_seconds_total 134.8
# HELP process_max_fds Maximum number of open file descriptors.
# TYPE process_max_fds gauge
process_max_fds 1024
# HELP process_open_fds Number of open file descriptors.
# TYPE process_open_fds gauge
process_open_fds 10
# HELP process_resident_memory_bytes Resident memory size in bytes.
# TYPE process_resident_memory_bytes gauge
process_resident_memory_bytes 2.9974528e+07
# HELP process_start_time_seconds Start time of the process since unix epoch in seconds.
# TYPE process_start_time_seconds gauge
process_start_time_seconds 1.56072593363e+09
# HELP process_virtual_memory_bytes Virtual memory size in bytes.
# TYPE process_virtual_memory_bytes gauge
process_virtual_memory_bytes 1.47894272e+08
# HELP process_virtual_memory_max_bytes Maximum amount of virtual memory available in bytes.
# TYPE process_virtual_memory_max_bytes gauge
process_virtual_memory_max_bytes -1
```
